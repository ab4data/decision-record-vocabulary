# Insurance claims assessment

**Sector:** insurance

| `code` | `class` | Use when |
|---|---|---|
| `within_policy` | `conformed` | Met the policy terms with no complication |
| `documentation_incomplete` | `evidence_insufficient` | Required evidence missing or unreadable |
| `valuation_disputed` | `evidence_contradicts` | Amount claimed does not match the assessed value |
| `coverage_excluded` | `out_of_scope` | The event falls outside the cover |
| `timing_outside_terms` | `timing` | Notification or incident date outside the window |
| `suspected_misstatement` | `evidence_contradicts` | The account given conflicts with the evidence |
| `referred_specialist` | `authority_exceeded` | Beyond the assessor authority or expertise |
| `other` | `other` | Free text required |
