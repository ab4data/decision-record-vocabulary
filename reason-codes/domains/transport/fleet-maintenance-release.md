# Vehicle return to service

**Sector:** transport

| `code` | `class` | Use when |
|---|---|---|
| `released_serviceable` | `conformed` | All scheduled tasks complete and signed |
| `defect_history_incomplete` | `evidence_insufficient` | Previous repair not documented |
| `symptom_not_reproduced` | `evidence_contradicts` | Reported fault could not be reproduced |
| `roadworthiness_rule` | `rule_conflict` | A statutory requirement not met |
| `wear_within_limits_but_trending` | `risk_elevated` | Held on trend rather than measurement |
| `parts_unavailable` | `capacity_or_cost` | Serviceable pending a part |
| `manufacturer_recall` | `third_party` | Held under a recall notice |
| `other` | `other` | Free text required |
