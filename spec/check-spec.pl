#!/usr/bin/perl
# The repository's own self-test. Verifies that the JSON Schema is well formed,
# that every enum in it matches the matching vocabulary CSV exactly, and that
# the worked example satisfies every rule the schema states.
#
#   cd spec && perl check-spec.pl
#
# To check your own extract instead, use check-profile.pl.
use strict; use warnings;
use JSON::PP;

my $errors = 0;

# ---- schema parses ---------------------------------------------------------
my $raw = do { open my $fh, '<:raw', 'decision-record.schema.json'
                 or die "no schema: $!"; local $/; <$fh> };
my $schema = eval { JSON::PP->new->utf8->decode($raw) };
if (!$schema) { print "FAIL  schema is not valid JSON: $@\n"; exit 1 }
print "  ok    schema parses as JSON\n";

for my $key ('$schema', '$id', 'title', 'type', 'properties', 'required', '$defs') {
  unless (exists $schema->{$key}) { print "FAIL  schema missing top-level '$key'\n"; $errors++ }
}
print "  ok    schema has the expected top-level keys\n" unless $errors;

# ---- every enum matches its CSV -------------------------------------------
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

my %map = (
  outcome              => 'outcome',
  worker_kind          => 'worker_kind',
  reason_class         => 'reason_class',
  decision_automation  => 'decision_automation',
  detection_automation => 'detection_automation',
);

for my $def (sort keys %map) {
  my @spec = @{ $schema->{'$defs'}{$def}{enum} || [] };
  my @csv  = csv_values($map{$def});
  my $a = join('|', sort @spec);
  my $b = join('|', sort @csv);
  if (!@spec) {
    print "FAIL  \$defs/$def has no enum\n"; $errors++;
  } elsif ($a ne $b) {
    print "FAIL  \$defs/$def does not match vocab/$map{$def}.csv\n        schema: $a\n        csv:    $b\n";
    $errors++;
  } else {
    printf "  ok    \$defs/%-21s matches vocab/%s.csv (%d values)\n", $def, $map{$def}, scalar @spec;
  }
}

# ---- basis_ref relations match --------------------------------------------
my @rel_spec = @{ $schema->{'$defs'}{basis_ref}{properties}{rel}{enum} || [] };
my @rel_csv  = csv_values('basis_relation');
if (join('|', sort @rel_spec) ne join('|', sort @rel_csv)) {
  print "FAIL  basis_ref.rel does not match vocab/basis_relation.csv\n"; $errors++;
} else {
  printf "  ok    basis_ref.rel%-13s matches vocab/basis_relation.csv (%d values)\n", '', scalar @rel_spec;
}

# ---- every reason_class has a locus, and every locus a posture -------------
my %locus_parent = map { my @f = split /,/; ($f[0] => $f[1]) }
                   grep { !/^value,/ } do { open my $f,'<','vocab/locus.csv' or die; <$f> };
my $class_ok = 1;
for my $line (do { open my $f,'<','vocab/reason_class.csv' or die; <$f> }) {
  next if $line =~ /^value,/;
  my ($value, $parent) = split /,/, $line;
  next unless defined $value && length $value;
  unless (defined $parent && exists $locus_parent{$parent}) {
    print "FAIL  reason_class '$value' points at locus '" . ($parent // '') . "', which is not declared\n";
    $errors++; $class_ok = 0;
  }
}
print "  ok    every reason_class points at a declared locus\n" if $class_ok;

# ---- the worked example satisfies every rule the schema states -------------
if (-f '../example/decisions.json') {
  my $ejson = do { open my $e, '<:raw', '../example/decisions.json' or die; local $/; <$e> };
  my $rows = eval { JSON::PP->new->utf8->decode($ejson) };
  if (!$rows) {
    print "FAIL  example/decisions.json is not valid JSON\n"; $errors++;
  } else {
    my @req  = @{ $schema->{required} };
    my %enum = map { $_ => { map { $_ => 1 } @{ $schema->{'$defs'}{$_}{enum} } } }
               qw(outcome worker_kind reason_class);
    $enum{proposed_outcome} = $enum{outcome};
    my $bad = 0;
    for my $r (@$rows) {
      my $id = $r->{decision_id} || '(no id)';
      for my $f (@req) {
        unless (defined $r->{$f}) { print "FAIL  $id: missing required $f\n"; $bad++ }
      }
      for my $f (sort keys %enum) {
        next unless defined $r->{$f};
        unless ($enum{$f}{ $r->{$f} }) { print "FAIL  $id: $f='$r->{$f}' is not in the enum\n"; $bad++ }
      }
      if (($r->{reason_class} || '') eq 'other' && !defined $r->{reason_text}) {
        print "FAIL  $id: reason_class 'other' without reason_text\n"; $bad++;
      }
      if (defined $r->{proposed_outcome} && ($r->{worker_kind} || '') ne 'person_with_agent') {
        print "FAIL  $id: proposed_outcome against worker_kind '" . ($r->{worker_kind} || '') . "'\n"; $bad++;
      }
      if (defined $r->{standard_set_at} && defined $r->{decided_at}
          && $r->{standard_set_at} gt $r->{decided_at}) {
        print "FAIL  $id: standard_set_at is later than decided_at\n"; $bad++;
      }
      for my $b (@{ $r->{basis_refs} || [] }) {
        for my $k (qw(type id rel)) {
          unless (defined $b->{$k} && length $b->{$k}) { print "FAIL  $id: basis_ref missing $k\n"; $bad++ }
        }
        if (defined $b->{rel} && !grep { $_ eq $b->{rel} } @rel_csv) {
          print "FAIL  $id: basis_ref rel='$b->{rel}' is not a declared relation\n"; $bad++;
        }
      }
    }
    $errors += $bad;
    printf "  %s  example: %d records checked against every rule the schema states\n",
           ($bad ? 'FAIL' : '  ok'), scalar @$rows;
  }
}

print $errors ? "\n  $errors PROBLEM(S)\n" : "\n  all checks passed\n";
exit($errors ? 1 : 0);
