# Inventory write-off decision

**Sector:** retail

| `code` | `class` | Use when |
|---|---|---|
| `within_shrinkage_tolerance` | `conformed` | Variance inside the accepted tolerance |
| `count_not_verified` | `evidence_insufficient` | Recount not performed before adjustment |
| `system_vs_physical` | `evidence_contradicts` | Physical count conflicts with system quantity |
| `obsolescence_policy` | `rule_conflict` | Aged stock rule applied |
| `damage_or_spoilage` | `risk_elevated` | Written off on condition |
| `disposal_cost` | `capacity_or_cost` | Disposal cheaper than holding |
| `supplier_credit_pending` | `third_party` | Awaiting a supplier claim outcome |
| `other` | `other` | Free text required |
