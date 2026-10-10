#!/usr/bin/perl
# Cross-domain analysis of the reason-code corpus.
# Reads domains/<sector>/<domain>.md beside this script and reports:
#   - corpus size
#   - class frequency and domain coverage
#   - the proposed two-level taxonomy, tested against the data
#   - which sectors diverge
use strict; use warnings;
my $root = "domains";

# class -> locus: where the thing that changed this decision came from
my %LOCUS = (
  conformed             => 'none',
  evidence_insufficient => 'input',
  evidence_contradicts  => 'input',
  rule_conflict         => 'rule',
  out_of_scope          => 'rule',
  risk_elevated         => 'judgement',
  authority_exceeded    => 'authority',
  capacity_or_cost      => 'resource',
  timing                => 'resource',
  third_party           => 'external',
  other                 => 'unclassified',
);

my (%cls_count, %cls_domains, %dom_cls, %sector_cls, %dom_sector, @domains, %bad);
for my $f (sort glob("$root/*/*.md")) {
  my ($sector, $dom) = $f =~ m{/([^/]+)/([^/]+)\.md$};
  push @domains, $dom; $dom_sector{$dom} = $sector;
  open my $fh, '<', $f or next;
  while (<$fh>) {
    next unless /^\|\s*`([^`]+)`\s*\|\s*`([^`]+)`\s*\|/;
    my ($code, $cls) = ($1, $2);
    next if $code eq 'code';
    $bad{"$dom:$code"} = 1 unless exists $LOCUS{$cls};
    $cls_count{$cls}++; $cls_domains{$cls}{$dom} = 1;
    $dom_cls{$dom}{$cls} = 1; $sector_cls{$sector}{$cls} = 1;
  }
}
my $nd = scalar @domains;
my $nc = 0; $nc += $_ for values %cls_count;
my $ns = scalar keys %sector_cls;

printf "CORPUS\n  %d domains across %d sectors, %d codes, %d classes\n", $nd, $ns, $nc, scalar keys %cls_count;
printf "  unmapped classes: %s\n\n", (keys %bad ? join(", ", sort keys %bad) : "none");

printf "CLASS FREQUENCY AND COVERAGE\n";
printf "  %-23s %6s %10s %8s  %s\n", "class", "codes", "domains", "pct", "locus";
printf "  %s\n", "-" x 74;
for my $c (sort { scalar(keys %{$cls_domains{$b}}) <=> scalar(keys %{$cls_domains{$a}}) } keys %cls_domains) {
  my $d = scalar keys %{$cls_domains{$c}};
  printf "  %-23s %6d %7d/%-3d %6d%%  %s\n", $c, $cls_count{$c}, $d, $nd, int(100*$d/$nd+0.5), $LOCUS{$c}//'?';
}

my @univ = grep { scalar(keys %{$cls_domains{$_}}) == $nd } keys %cls_domains;
printf "\n  in EVERY domain (%d): %s\n", scalar @univ, join(", ", sort @univ);

# ---- locus roll-up ----
my (%locus_count, %locus_domains);
for my $c (keys %cls_count) {
  my $l = $LOCUS{$c} // 'unmapped';
  $locus_count{$l} += $cls_count{$c};
  $locus_domains{$l}{$_} = 1 for keys %{$cls_domains{$c}};
}
printf "\nLEVEL 2 ROLL-UP: locus (where the departure originated)\n";
printf "  %-16s %6s %10s %8s\n", "locus", "codes", "domains", "pct";
printf "  %s\n", "-" x 46;
for my $l (sort { $locus_count{$b} <=> $locus_count{$a} } keys %locus_count) {
  my $d = scalar keys %{$locus_domains{$l}};
  printf "  %-16s %6d %7d/%-3d %6d%%\n", $l, $locus_count{$l}, $d, $nd, int(100*$d/$nd+0.5);
}

# ---- does the hierarchy hold across sectors? ----
printf "\nSECTOR TEST: how many of the 11 classes each sector uses\n";
for my $s (sort { scalar(keys %{$sector_cls{$b}}) <=> scalar(keys %{$sector_cls{$a}}) } keys %sector_cls) {
  my @missing = grep { !$sector_cls{$s}{$_} } sort keys %LOCUS;
  printf "  %-14s %2d/11   missing: %s\n", $s, scalar(keys %{$sector_cls{$s}}),
         (@missing ? join(" ", @missing) : "none");
}

# ---- codes per domain ----
my @sizes = sort { $a <=> $b } map { scalar keys %{$dom_cls{$_}} } @domains;
printf "\nCLASSES PER DOMAIN: min %d, median %d, max %d\n", $sizes[0], $sizes[$#sizes/2], $sizes[-1];
