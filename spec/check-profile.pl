#!/usr/bin/perl
# Reports which conformance profile a file of decision records meets, and what
# stands between it and the next one. See PROFILES.md.
#
#   cd spec && perl check-profile.pl ../example/decisions.json
#
# Input: a JSON array of records, or one JSON record per line. Run it from the
# spec/ directory so that the vocab/ CSVs can be found.
use strict; use warnings;
use JSON::PP;

my $path = shift @ARGV or die "usage: perl check-profile.pl <records.json>\n";

# Columns every record must carry, by level. Each level includes the one below.
my @CORE     = qw(decision_id task_type decided_at outcome reason_class);
my @STANDARD = qw(task_id attempt decided_by worker_kind reason_code decide_seconds);
my @FULL     = qw(basis_refs standard_set_at data_class
                  detected_automatically decision_automation);

# Recommended, never required: capture these if your systems already hold them.
my @RECOMMENDED = qw(model_id proposed_outcome reason_text);

my %LEVEL = (
  Core     => [@CORE],
  Standard => [@CORE, @STANDARD],
  Full     => [@CORE, @STANDARD, @FULL],
);

# ---- read ------------------------------------------------------------------
my $raw = do { open my $fh, '<:raw', $path or die "cannot read $path: $!\n"; local $/; <$fh> };

my $rows = eval { JSON::PP->new->utf8->relaxed->decode($raw) };
$rows = [$rows] if ref $rows eq 'HASH';
if (ref $rows ne 'ARRAY') {                      # fall back to JSON lines
  my @r;
  for my $line (split /\r?\n/, $raw) {
    next unless $line =~ /\S/;
    my $o = eval { JSON::PP->new->utf8->decode($line) } or next;
    push @r, $o;
  }
  $rows = \@r;
}
die "$path is neither a JSON array nor JSON lines\n" unless ref $rows eq 'ARRAY' && @$rows;

my $total = scalar @$rows;
printf "\n  %s\n  %d records\n\n", $path, $total;

sub filled {
  my ($r, $k) = @_;
  my $v = $r->{$k};
  return 0 unless defined $v;
  return (scalar @$v ? 1 : 0) if ref $v eq 'ARRAY';
  return 1 if ref $v;
  return (length $v ? 1 : 0);
}

my %present;
for my $r (@$rows) {
  for my $k (keys %$r) { $present{$k}++ if filled($r, $k) }
}

# ---- the published vocabularies -------------------------------------------
sub csv_values {
  my ($name) = @_;
  open my $f, '<', "vocab/$name.csv" or return;
  my @v; my $first = 1;
  while (defined(my $line = <$f>)) {
    if ($first) { $first = 0; next }
    $line =~ s/\s+$//; next unless length $line;
    my ($val) = split /,/, $line, 2; push @v, $val;
  }
  close $f; return @v;
}
my %ENUM;
for my $pair (['outcome', 'outcome'], ['proposed_outcome', 'outcome'],
              ['worker_kind', 'worker_kind'], ['reason_class', 'reason_class'],
              ['decision_automation', 'decision_automation'],
              ['detected_automatically', 'detection_automation']) {
  my @v = csv_values($pair->[1]);
  unless (@v) { warn "  note: vocab/$pair->[1].csv not found, skipping that check\n"; next }
  $ENUM{ $pair->[0] } = { map { $_ => 1 } @v };
}

# ---- the rules that hold at every level ------------------------------------
my (@bad_enum, @bad_rule);
my $n = 0;
for my $r (@$rows) {
  $n++;
  my $id = $r->{decision_id};
  $id = "record $n" unless defined $id && length $id;
  my $class = defined $r->{reason_class} ? $r->{reason_class} : '';
  my $wk    = defined $r->{worker_kind}  ? $r->{worker_kind}  : '';

  for my $f (sort keys %ENUM) {
    next unless filled($r, $f);
    push @bad_enum, "$id: $f = '$r->{$f}'" unless $ENUM{$f}{ $r->{$f} };
  }
  push @bad_rule, "$id: reason_class 'other' with no reason_text"
    if $class eq 'other' && !filled($r, 'reason_text');
  push @bad_rule, "$id: proposed_outcome recorded against worker_kind '$wk'"
    if filled($r, 'proposed_outcome') && $wk ne 'person_with_agent';
  push @bad_rule, "$id: standard_set_at is later than decided_at"
    if filled($r, 'standard_set_at') && filled($r, 'decided_at')
       && $r->{standard_set_at} gt $r->{decided_at};
  for my $b (@{ $r->{basis_refs} || [] }) {
    push @bad_rule, "$id: a basis_ref is missing type, id or rel"
      unless ref $b eq 'HASH'
          && defined $b->{type} && defined $b->{id} && defined $b->{rel};
  }
}

# ---- what the optional columns buy, reported but never fatal ---------------
my ($proposals, $overridden) = (0, 0);
for my $r (@$rows) {
  next unless filled($r, 'proposed_outcome');
  $proposals++;
  my $p = $r->{proposed_outcome};
  my $o = defined $r->{outcome} ? $r->{outcome} : '';
  $overridden++ if $p ne $o;
}

# ---- report ----------------------------------------------------------------
my $clean = !(@bad_enum || @bad_rule);
my $met = '';
for my $label (qw(Core Standard Full)) {
  my (@have, @partial, @missing);
  for my $c (@{ $LEVEL{$label} }) {
    my $k = $present{$c} || 0;
    if    ($k == $total) { push @have,    $c }
    elsif ($k == 0)      { push @missing, $c }
    else                 { push @partial, sprintf('%s (%d of %d)', $c, $k, $total) }
  }
  my $ok = (!@missing && !@partial && $clean);
  printf "  %-9s %-5s %2d of %2d columns on every record\n",
         $label, ($ok ? 'MET' : '--'), scalar @have, scalar @{ $LEVEL{$label} };
  print  "              partial:  ", join(', ', @partial), "\n" if @partial;
  print  "              missing:  ", join(', ', @missing), "\n" if @missing;
  $met = $label if $ok;
}

my @rec_have = grep { $present{$_} } @RECOMMENDED;
printf "\n  recommended columns present: %s\n", (@rec_have ? join(', ', @rec_have) : 'none');
if ($proposals) {
  printf "  software proposed and a person decided: %d record%s, of which the\n",
         $proposals, ($proposals == 1 ? '' : 's');
  printf "  person changed the proposed outcome on %d\n", $overridden;
}

if (@bad_enum) {
  printf "\n  %d value(s) outside the published vocabulary:\n", scalar @bad_enum;
  print  "    $_\n" for @bad_enum[0 .. ($#bad_enum > 9 ? 9 : $#bad_enum)];
  printf "    ... and %d more\n", scalar(@bad_enum) - 10 if @bad_enum > 10;
}
if (@bad_rule) {
  printf "\n  %d rule breach(es):\n", scalar @bad_rule;
  print  "    $_\n" for @bad_rule[0 .. ($#bad_rule > 9 ? 9 : $#bad_rule)];
  printf "    ... and %d more\n", scalar(@bad_rule) - 10 if @bad_rule > 10;
}

print "\n";
if    ($met)   { print "  This extract meets the $met profile.\n" }
elsif ($clean) { print "  Add the columns listed above to reach the next profile.\n" }
else           { print "  Correct the values above, then run this again.\n" }
print "\n";
exit($clean ? 0 : 1);
