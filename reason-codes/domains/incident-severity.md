# IT incident severity classification

| `code` | `class` | Use when |
|---|---|---|
| `matches_severity_matrix` | conformed | Impact and urgency scored to the published matrix |
| `impact_unknown` | evidence_insufficient | Severity set before the blast radius was known |
| `reported_vs_observed` | evidence_contradicts | Reported impact differs from telemetry |
| `customer_facing_uplift` | risk_elevated | Raised because customers are affected |
| `data_integrity_risk` | risk_elevated | Raised because data may be wrong rather than absent |
| `workaround_available` | capacity_or_cost | Lowered because a workaround holds |
| `vendor_dependency` | third_party | Resolution sits with a supplier |
| `major_incident_declared` | authority_exceeded | Escalated beyond the on-call engineer |
| `other` | other | Free text required |
