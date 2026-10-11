#!/usr/bin/perl
# Generates the controlled-vocabulary CSVs from one source of truth below,
# and checks them against the markdown documentation so the two cannot drift.
#
#   perl build-vocab.pl          write the CSVs and verify
#   perl build-vocab.pl --check  verify only, exit 1 on mismatch
use strict; use warnings;

my $check_only = (@ARGV && $ARGV[0] eq '--check');
my $VERSION = '0.1.0';

# ---- source of truth -------------------------------------------------------
# value | parent | status | definition
my %VOCAB = (
  posture => [
    ['conformed','','stable','The standard, protocol or policy applied and was followed.'],
    ['departed','','stable','Something made this decision different from the default.'],
  ],
  locus => [
    ['input','departed','stable','The departure came from what arrived: not enough, or it did not add up. Acted on by whoever owns intake.'],
    ['rule','departed','stable','The departure came from the rules themselves. Acted on by whoever owns the policy.'],
    ['judgement','departed','stable','A person assessed risk or consequence. Acted on through training and calibration.'],
    ['resource','departed','stable','Money, people, time or a deadline shaped it. Acted on through funding and scheduling.'],
    ['external','departed','stable','Decided by someone outside the organisation. Managed rather than fixed.'],
    ['authority','departed','stable','Beyond the decider delegation. Acted on by whoever sets delegations.'],
    ['none','conformed','stable','No departure occurred.'],
    ['unclassified','departed','stable','A departure that does not fit the defined loci.'],
  ],
  reason_class => [
    ['conformed','none','stable','The standard applied and was followed. Every list needs this value; without it there is no denominator.'],
    ['evidence_insufficient','input','stable','There was not enough to go on: missing, incomplete, unreadable, unverifiable or not yet available.'],
    ['evidence_contradicts','input','stable','What was supplied conflicts with something else that is known.'],
    ['rule_conflict','rule','stable','A specific rule, policy, threshold or standard was breached or engaged.'],
    ['out_of_scope','rule','provisional','The matter does not fall within the boundary of what is being decided. Lowest coverage in the corpus; may collapse into rule_conflict.'],
    ['risk_elevated','judgement','stable','An assessment of risk, consequence or trajectory drove the outcome rather than a rule.'],
    ['capacity_or_cost','resource','stable','Resources, budget, volume or cost to serve shaped the decision.'],
    ['timing','resource','stable','A deadline, window, sequence or statutory clock shaped the outcome.'],
    ['third_party','external','stable','The outcome was determined by someone outside the deciding organisation.'],
    ['authority_exceeded','authority','stable','Beyond the decider delegation: referred, escalated, or stood aside.'],
    ['other','unclassified','stable','None of the above. Free text required, and the rate is monitored.'],
  ],
  worker_kind => [
    ['person','','stable','A human decided, unaided by a model.'],
    ['agent','','stable','Software chose its own next step and decided.'],
    ['deterministic_code','','stable','A rule fired. No model involved.'],
    ['person_with_agent','','stable','A person decided with model assistance. Most work within two years, and the value most often left out of schemas.'],
  ],
  outcome => [
    ['accepted','','stable','The work was accepted as produced.'],
    ['edited','','stable','The work was accepted after change.'],
    ['rejected','','stable','The work was not accepted.'],
    ['abandoned','','stable','The attempt ended without a judgement being reached.'],
  ],
  basis_relation => [
    ['applied','','stable','A rule, policy or standard that governed this decision was applied to it.'],
    ['assessed','','stable','The subject matter that was examined in order to decide.'],
    ['cited','','stable','Supporting material that was in front of the decider and informed the decision.'],
    ['supersedes','','stable','This decision replaces an earlier decision, which is kept and marked rather than deleted.'],
  ],
  decision_automation => [
    ['fully','','stable','The decision was made by software with no human judgement applied.'],
    ['partially','','stable','Software and a person both contributed to the decision.'],
    ['not_automated','','stable','A person decided without software making or directly supporting the decision.'],
  ],
  detection_automation => [
    ['yes','','stable','The matter was surfaced for decision automatically.'],
    ['no','','stable','The matter was surfaced for decision by a person.'],
  ],
);

# ---- write -----------------------------------------------------------------
my $errors = 0;
for my $name (sort keys %VOCAB) {
  my $path = "vocab/$name.csv";
  my $out = "value,parent,status,definition\n";
  for my $r (@{$VOCAB{$name}}) {
    my ($v,$p,$s,$d) = @$r;
    $d =~ s/"/""/g;
    $out .= sprintf("%s,%s,%s,\"%s\"\n", $v, $p, $s, $d);
  }
  if ($check_only) {
    open my $fh, '<', $path or do { warn "MISSING $path\n"; $errors++; next };
    local $/; my $have = <$fh>; close $fh;
    $have =~ s/\r\n/\n/g;
    if ($have ne $out) { warn "DRIFT   $path\n"; $errors++ }
    else { print "  ok      $path\n" }
  } else {
    open my $fh, '>', $path or die "cannot write $path: $!";
    print $fh $out; close $fh;
    printf "  wrote   %-34s %d values\n", $path, scalar @{$VOCAB{$name}};
  }
}

# ---- internal consistency --------------------------------------------------
my %locus_names = map { $_->[0] => 1 } @{$VOCAB{locus}};
for my $r (@{$VOCAB{reason_class}}) {
  unless ($locus_names{$r->[1]}) { warn "BAD PARENT  reason_class $r->[0] -> $r->[1]\n"; $errors++ }
}
my %posture_names = map { $_->[0] => 1 } @{$VOCAB{posture}};
for my $r (@{$VOCAB{locus}}) {
  unless ($posture_names{$r->[1]}) { warn "BAD PARENT  locus $r->[0] -> $r->[1]\n"; $errors++ }
}

# ---- cross-check against the 87 domain lists -------------------------------
my %used;
for my $f (glob("../reason-codes/domains/*/*.md")) {
  open my $fh, '<', $f or next;
  while (<$fh>) { next unless /^\|\s*`([^`]+)`\s*\|\s*`([^`]+)`\s*\|/; next if $1 eq 'code'; $used{$2}++ }
}
my %declared = map { $_->[0] => 1 } @{$VOCAB{reason_class}};
for my $c (sort keys %used) {
  unless ($declared{$c}) { warn "IN CORPUS, NOT IN SPEC: $c\n"; $errors++ }
}
for my $c (sort keys %declared) {
  unless ($used{$c}) { warn "IN SPEC, NOT IN CORPUS: $c\n"; $errors++ }
}

printf "\n  vocabulary version %s\n", $VERSION;
printf "  reason classes declared: %d, used across the corpus: %d\n",
       scalar(keys %declared), scalar(keys %used);
print  $errors ? "  $errors PROBLEM(S)\n" : "  all checks passed\n";
exit($errors ? 1 : 0);
