# Service desk triage

**Sector:** technology

| `code` | `class` | Use when |
|---|---|---|
| `known_issue` | `conformed` | Matches a recorded problem with a known workaround |
| `insufficient_detail` | `evidence_insufficient` | Could not be progressed as reported |
| `user_error` | `evidence_contradicts` | Resolved by guidance rather than by change |
| `data_quality` | `evidence_contradicts` | The system behaved correctly on incorrect data |
| `access_rights` | `rule_conflict` | A permissions or entitlement matter |
| `defect_suspected` | `risk_elevated` | Reproducible and unexplained, escalated |
| `third_party` | `third_party` | Cause sits outside systems we control |
| `other` | `other` | Free text required |
