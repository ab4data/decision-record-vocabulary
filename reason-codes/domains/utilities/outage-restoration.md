# Outage restoration prioritisation

**Sector:** utilities

| `code` | `class` | Use when |
|---|---|---|
| `restored_to_priority` | `conformed` | Sequenced by the published restoration priority |
| `fault_location_unknown` | `evidence_insufficient` | Fault not yet located |
| `reported_vs_telemetry` | `evidence_contradicts` | Customer reports conflict with network telemetry |
| `life_support_customer` | `rule_conflict` | Registered critical customer changed the sequence |
| `access_or_safety` | `risk_elevated` | Deferred on crew safety or site access |
| `crew_availability` | `capacity_or_cost` | Sequence shaped by available crews |
| `another_utility` | `third_party` | Dependent on another utility making safe |
| `other` | `other` | Free text required |
