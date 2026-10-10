# Platform content moderation

**Sector:** media

| `code` | `class` | Use when |
|---|---|---|
| `no_breach_found` | `conformed` | Reported, assessed, and left in place |
| `insufficient_context` | `evidence_insufficient` | Could not be judged on the material available |
| `policy_breach_clear` | `rule_conflict` | Unambiguously against a published rule |
| `policy_breach_contextual` | `rule_conflict` | Against a rule once context is taken into account |
| `legal_requirement` | `rule_conflict` | Required by law or a valid order |
| `coordinated_behaviour` | `risk_elevated` | Actioned on pattern across accounts |
| `rights_complaint_upheld` | `third_party` | A complaint from a rights holder was accepted |
| `escalated_specialist` | `authority_exceeded` | Beyond the reviewer authority |
| `other` | `other` | Free text required |
