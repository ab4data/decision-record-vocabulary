# Electrical network switching approval

**Sector:** utilities

| `code` | `class` | Use when |
|---|---|---|
| `approved_to_procedure` | `conformed` | Switching sheet matches the approved procedure |
| `network_model_outdated` | `evidence_insufficient` | As-built status of the asset unconfirmed |
| `field_differs_from_model` | `evidence_contradicts` | Field inspection contradicts the network model |
| `protection_coordination` | `rule_conflict` | Would leave protection settings non-compliant |
| `customer_impact` | `risk_elevated` | Deferred on criticality of connected load |
| `weather_window` | `timing` | Timing set by conditions rather than by plan |
| `market_or_aemo` | `third_party` | Constrained by the market operator |
| `other` | `other` | Free text required |
