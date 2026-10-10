# Tax audit case selection

**Sector:** government

| `code` | `class` | Use when |
|---|---|---|
| `profile_within_norms` | `conformed` | Return consistent with the benchmark for the segment |
| `records_not_lodged` | `evidence_insufficient` | Required schedules or statements missing |
| `return_vs_thirdparty_data` | `evidence_contradicts` | Return conflicts with reported third-party data |
| `risk_model_flag` | `risk_elevated` | Selected on model score rather than a specific anomaly |
| `specific_rule_breach` | `rule_conflict` | A defined provision appears not to be met |
| `audit_capacity` | `capacity_or_cost` | Case worth pursuing, resources committed elsewhere |
| `amendment_period_closed` | `timing` | Outside the period of review |
| `other` | `other` | Free text required |
