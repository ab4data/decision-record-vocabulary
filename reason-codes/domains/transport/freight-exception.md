# Freight exception handling

**Sector:** transport

| `code` | `class` | Use when |
|---|---|---|
| `delivered_as_booked` | `conformed` | Consignment delivered within the service standard |
| `pod_missing` | `evidence_insufficient` | No proof of delivery captured |
| `scan_history_conflicts` | `evidence_contradicts` | Scan events inconsistent with the reported location |
| `dangerous_goods_rule` | `rule_conflict` | Handling governed by a dangerous goods requirement |
| `temperature_excursion` | `risk_elevated` | Rejected on cold chain integrity |
| `capacity_reallocation` | `capacity_or_cost` | Reassigned because of linehaul capacity |
| `carrier_delay` | `third_party` | Delay caused by a subcontracted carrier |
| `other` | `other` | Free text required |
