# Defect triage

**Sector:** technology

| `code` | `class` | Use when |
|---|---|---|
| `accepted_to_backlog` | `conformed` | Reproduced and prioritised to the standard |
| `cannot_reproduce` | `evidence_insufficient` | Insufficient detail to reproduce |
| `works_as_designed` | `evidence_contradicts` | Behaviour matches the specification |
| `duplicate` | `rule_conflict` | Already tracked elsewhere |
| `out_of_support_scope` | `out_of_scope` | Unsupported version, platform or configuration |
| `severity_uplift_security` | `risk_elevated` | Prioritised on security rather than frequency |
| `upstream_defect` | `third_party` | Cause sits in a dependency |
| `wont_fix_cost` | `capacity_or_cost` | Real, and not worth the cost to fix |
| `other` | `other` | Free text required |
