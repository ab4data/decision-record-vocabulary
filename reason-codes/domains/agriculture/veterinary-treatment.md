# Veterinary treatment decision

**Sector:** agriculture

| `code` | `class` | Use when |
|---|---|---|
| `treated_per_protocol` | `conformed` | The standard treatment was applied |
| `history_unavailable` | `evidence_insufficient` | No prior treatment or movement record for the animal |
| `signs_inconsistent` | `evidence_contradicts` | Clinical signs conflict with the test result |
| `withholding_period` | `rule_conflict` | Restricted by a residue or withholding rule |
| `welfare_trajectory` | `risk_elevated` | Decided on welfare trajectory rather than a protocol |
| `herd_scale_cost` | `capacity_or_cost` | Cost per head across the mob shaped the choice |
| `seasonal_window` | `timing` | The treatment window is closed or not yet open |
| `owner_declined` | `third_party` | The owner declined the recommended course |
| `other` | `other` | Free text required |
