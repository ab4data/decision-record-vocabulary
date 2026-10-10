# Pharmaceutical batch release

**Sector:** manufacturing

| `code` | `class` | Use when |
|---|---|---|
| `released_to_specification` | `conformed` | All critical attributes within specification |
| `documentation_gap` | `evidence_insufficient` | Batch record incomplete |
| `in_process_vs_final` | `evidence_contradicts` | In-process results conflict with final testing |
| `out_of_specification` | `rule_conflict` | A specification limit exceeded |
| `deviation_open` | `risk_elevated` | Held pending closure of a deviation |
| `stability_data_pending` | `timing` | Release deferred for stability confirmation |
| `qualified_person_referral` | `authority_exceeded` | Beyond the release delegation |
| `other` | `other` | Free text required |
