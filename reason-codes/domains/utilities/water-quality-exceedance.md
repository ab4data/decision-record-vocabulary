# Water quality exceedance response

**Sector:** utilities

| `code` | `class` | Use when |
|---|---|---|
| `within_guideline` | `conformed` | Result inside the guideline value |
| `sample_integrity_doubt` | `evidence_insufficient` | Chain of custody or holding time compromised |
| `resample_disagrees` | `evidence_contradicts` | Repeat sample does not confirm the exceedance |
| `health_based_guideline` | `rule_conflict` | Health-related value exceeded, notification required |
| `distribution_system_risk` | `risk_elevated` | Escalated on network location rather than value alone |
| `treatment_capacity` | `capacity_or_cost` | Response limited by available treatment |
| `regulator_directed` | `third_party` | Action set by the health regulator |
| `other` | `other` | Free text required |
