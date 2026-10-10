# Nursing deterioration escalation

**Sector:** health

| `code` | `class` | Use when |
|---|---|---|
| `escalated_per_criteria` | `conformed` | Observations met the published escalation trigger |
| `observations_incomplete` | `evidence_insufficient` | A required observation was not taken |
| `chart_conflicts_with_patient` | `evidence_contradicts` | Recorded observations do not match presentation |
| `clinical_concern_override` | `risk_elevated` | Escalated on judgement without meeting a trigger |
| `treatment_limits_apply` | `rule_conflict` | An advance care directive shaped the response |
| `reviewer_unavailable` | `capacity_or_cost` | Escalated further because no reviewer was free |
| `family_initiated` | `third_party` | Escalation requested by family rather than by staff |
| `other` | `other` | Free text required |
