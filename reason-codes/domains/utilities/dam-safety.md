# Dam safety surveillance decision

**Sector:** utilities

| `code` | `class` | Use when |
|---|---|---|
| `within_normal_range` | `conformed` | Instrumentation inside expected bounds |
| `instrument_fault` | `evidence_insufficient` | Reading unavailable or unreliable |
| `visual_vs_instrument` | `evidence_contradicts` | Inspection does not match instrument trend |
| `trigger_level_reached` | `rule_conflict` | Defined trigger level crossed |
| `consequence_category` | `risk_elevated` | Response set by downstream consequence |
| `works_funding` | `capacity_or_cost` | Remediation deferred to a funded programme |
| `regulator_notified` | `authority_exceeded` | Escalated to the dam safety regulator |
| `other` | `other` | Free text required |
