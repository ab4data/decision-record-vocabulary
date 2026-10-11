#!/usr/bin/perl
# Builds the two synthetic fact tables, their shared dimension and the basis
# edge list, then runs the drill-across in plain Perl so that the expected
# answer is computed rather than asserted. Writes expected-output.txt.
#
#   perl make-example.pl
#
# ALL DATA HERE IS SYNTHETIC. No real decision data appears in this repository.
use strict; use warnings;
use JSON::PP;

# reason_code => reason_class, per domain. Local words, shared classes.
my %CLAIMS = (
  within_policy            => 'conformed',
  documentation_incomplete => 'evidence_insufficient',
  valuation_disputed       => 'evidence_contradicts',
  coverage_excluded        => 'out_of_scope',
  timing_outside_terms     => 'timing',
  referred_specialist      => 'authority_exceeded',
  other                    => 'other',
);
my %REVIEWS = (
  meets_standard        => 'conformed',
  test_coverage         => 'evidence_insufficient',
  works_as_specified    => 'evidence_contradicts',
  correctness_risk      => 'rule_conflict',
  security_concern      => 'risk_elevated',
  upstream_defect       => 'third_party',
  other                 => 'other',
);

# code, n, outcome, worker_kind, seconds, proposed_outcome ('' = nothing proposed)
my @CLAIM_ROWS = (
  ['within_policy',            6, 'accepted',  'deterministic_code',  4, ''        ],
  ['within_policy',            3, 'accepted',  'person_with_agent',  38, 'accepted'],
  ['documentation_incomplete', 3, 'rejected',  'person_with_agent',  95, 'rejected'],
  ['documentation_incomplete', 2, 'rejected',  'person_with_agent', 130, 'accepted'],
  ['documentation_incomplete', 2, 'abandoned', 'person',            140, ''        ],
  ['valuation_disputed',       3, 'edited',    'person_with_agent', 210, 'accepted'],
  ['coverage_excluded',        2, 'rejected',  'person',             88, ''        ],
  ['timing_outside_terms',     1, 'rejected',  'deterministic_code',  3, ''        ],
  ['referred_specialist',      2, 'abandoned', 'person',             55, ''        ],
  ['other',                    1, 'edited',    'person',            300, ''        ],
);
my @REVIEW_ROWS = (
  ['meets_standard',     8, 'accepted',  'person_with_agent', 120, 'accepted'],
  ['test_coverage',      2, 'edited',    'person_with_agent', 260, 'edited'  ],
  ['test_coverage',      2, 'edited',    'person_with_agent', 300, 'accepted'],
  ['works_as_specified', 2, 'rejected',  'person',             90, ''        ],
  ['correctness_risk',   3, 'edited',    'person',            340, ''        ],
  ['security_concern',   2, 'rejected',  'person_with_agent', 410, 'rejected'],
  ['upstream_defect',    1, 'abandoned', 'person',             75, ''        ],
  ['other',              1, 'edited',    'person',            180, ''        ],
);

# Each domain keeps its own standard, written before any of this work started,
# and its own sensitivity scheme. Neither is shared; both stay comparable.
my %DOMAIN = (
  CLM => { task_type => 'claims.assessment', standard_set_at => '2026-08-15T00:00:00Z',
           data_class => 'personal', model => 'house-assist-2026-03' },
  REV => { task_type => 'code.review',       standard_set_at => '2026-07-01T00:00:00Z',
           data_class => 'internal', model => 'house-assist-2026-03' },
);

my (@all, @claims, @reviews, @basis);
my $t = 0;

sub build {
  my ($prefix, $map, $rows, $sink) = @_;
  my $d = $DOMAIN{$prefix};
  my $i = 0;
  for my $r (@$rows) {
    my ($code, $n, $outcome, $wk, $secs, $proposed) = @$r;
    for (1 .. $n) {
      $i++; $t++;
      my $id = sprintf('%s-%04d', $prefix, $i);
      my %row = (
        decision_id     => $id,
        task_id         => sprintf('%s-T%04d', $prefix, $i),
        attempt         => 1,
        task_type       => $d->{task_type},
        standard_set_at => $d->{standard_set_at},
        decided_at      => sprintf('2026-09-%02dT%02d:%02d:00Z',
                                   1 + ($t % 28), 8 + ($t % 9), ($t * 7) % 60),
        decided_by      => sprintf('%s-staff-%02d', $prefix, 1 + ($t % 6)),
        outcome         => $outcome,
        worker_kind     => $wk,
        reason_code     => $code,
        reason_class    => $map->{$code},
        data_class      => $d->{data_class},
        decide_seconds  => $secs,
        detected_automatically => ($wk eq 'deterministic_code' ? 'yes' : 'no'),
        decision_automation    => ($wk eq 'deterministic_code' ? 'fully'
                                 : $wk eq 'person_with_agent'  ? 'partially'
                                 :                               'not_automated'),
      );
      $row{reason_text}      = 'see case notes' if $code eq 'other';
      $row{proposed_outcome} = $proposed        if length $proposed;
      $row{model_id}         = $d->{model}      if $wk eq 'person_with_agent';

      $row{basis_refs} = $prefix eq 'CLM'
        ? [ { type => 'policy',   id => 'motor-v9', rel => 'applied'  },
            { type => 'claim',    id => "CL-7$i",   rel => 'assessed' } ]
        : [ { type => 'decision', id => 'ADR-0042', rel => 'applied'  },
            { type => 'commit',   id => "c9f$i",    rel => 'assessed' } ];
      push @basis, [$id, $_->{type}, $_->{id}, $_->{rel}] for @{ $row{basis_refs} };

      push @all, \%row; push @$sink, \%row;
    }
  }
}

build('CLM', \%CLAIMS,  \@CLAIM_ROWS,  \@claims);
build('REV', \%REVIEWS, \@REVIEW_ROWS, \@reviews);

# ---- the two fact tables, as separate CSVs, never merged -------------------
my @cols = qw(decision_id task_id attempt task_type standard_set_at decided_at
              decided_by outcome proposed_outcome worker_kind model_id
              reason_code reason_class reason_text data_class decide_seconds
              detected_automatically decision_automation);
sub csv_cell { my $v = shift; $v = '' unless defined $v; $v =~ s/"/""/g;
               return $v =~ /[,"]/ ? "\"$v\"" : $v }
sub write_csv {
  my ($path, $header, $rows) = @_;
  open my $fh, '>', $path or die "cannot write $path: $!";
  print $fh join(',', @$header), "\n";
  print $fh join(',', map { csv_cell($_) } @$_), "\n" for @$rows;
  close $fh;
  printf "  wrote  %-26s %3d rows\n", $path, scalar @$rows;
}
sub flatten { my $rows = shift; return [ map { my $r = $_; [ map { $r->{$_} } @cols ] } @$rows ] }
write_csv('claim_assessments.csv', \@cols, flatten(\@claims));
write_csv('code_reviews.csv',      \@cols, flatten(\@reviews));

# ---- basis_refs, as the child table it becomes in a relational store -------
write_csv('decision_basis.csv', [qw(decision_id basis_type basis_id rel)], \@basis);

# ---- the conformed dimension, shared by both -------------------------------
open my $src, '<', '../spec/vocab/reason_class.csv' or die "need the spec: $!";
open my $dst, '>', 'dim_reason_class.csv' or die $!;
print $dst $_ while <$src>;
close $src; close $dst;
print "  wrote  dim_reason_class.csv      (copied from spec/vocab, the single source)\n";

# ---- json form, for schema and profile checking ----------------------------
open my $j, '>:raw', 'decisions.json' or die $!;
print $j JSON::PP->new->utf8->canonical->pretty->encode(\@all);
close $j;
printf "  wrote  %-26s %3d rows\n", 'decisions.json', scalar @all;

# ---- THE DRILL-ACROSS, computed rather than asserted -----------------------
my %locus_of;
open my $l, '<', '../spec/vocab/reason_class.csv' or die $!;
my $first = 1;
while (defined(my $line = <$l>)) {
  if ($first) { $first = 0; next }
  $line =~ s/\s+$//; next unless length $line;
  my ($value, $parent) = split /,/, $line;
  $locus_of{$value} = $parent;
}
close $l;

sub tally { my %h; $h{ $locus_of{ $_->{reason_class} } || '?' }++ for @{ $_[0] }; return \%h }
my $c = tally(\@claims);
my $r = tally(\@reviews);
my %loci; $loci{$_} = 1 for (keys %$c, keys %$r);

open my $out, '>', 'expected-output.txt' or die $!;
print $out "Departures by locus, across two tables that were never joined.\n";
print $out "Generated by make-example.pl. Synthetic data.\n\n";
printf $out "%-14s %18s %14s %10s\n", 'locus', 'claim assessments', 'code reviews', 'total';
print $out '-' x 60, "\n";
my ($tc, $tr) = (0, 0);
for my $k (sort { ($c->{$b}||0)+($r->{$b}||0) <=> ($c->{$a}||0)+($r->{$a}||0) or $a cmp $b } keys %loci) {
  my $x = $c->{$k} || 0;
  my $y = $r->{$k} || 0;
  $tc += $x; $tr += $y;
  printf $out "%-14s %18d %14d %10d\n", $k, $x, $y, $x + $y;
}
printf $out "%s\n%-14s %18d %14d %10d\n", '-' x 60, 'TOTAL', $tc, $tr, $tc + $tr;

# ---- and the override rate, which only person_with_agent rows can give -----
my ($pwa, $over) = (0, 0);
for my $row (@all) {
  next unless defined $row->{proposed_outcome};
  $pwa++;
  $over++ if $row->{proposed_outcome} ne $row->{outcome};
}
printf $out "\nOf %d decisions where software proposed and a person decided, the person\n", $pwa;
printf $out "changed the proposed outcome %d times.\n", $over;

# ---- and what basis_refs is for: the blast radius of one policy change -----
my %applied;
for my $b (@basis) {
  my ($id, $type, $ref, $rel) = @$b;
  $applied{"$type:$ref"}++ if $rel eq 'applied';
}
print $out "\nDecisions that applied each governing record, which is the list you want\n";
print $out "on the morning one of them changes:\n\n";
printf $out "  %-24s %6d\n", $_, $applied{$_} for sort { $applied{$b} <=> $applied{$a} or $a cmp $b } keys %applied;
close $out;

print "\n";
open my $show, '<', 'expected-output.txt' or die $!;
print "  $_" while <$show>;
close $show;
