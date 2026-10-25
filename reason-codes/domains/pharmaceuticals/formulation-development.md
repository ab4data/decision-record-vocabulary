# Formulation development decision

**Sector:** pharmaceuticals

| `code` | `class` | Use when |
|---|---|---|
| `formulation_meets_spec` | `conformed` | Stability and release profile meet the target |
| `stability_data_incomplete` | `evidence_insufficient` | Too few time points to assess shelf life |
| `dissolution_inconsistent` | `evidence_contradicts` | Batch results disagree across sites |
| `excipient_not_approved` | `rule_conflict` | Excipient outside the accepted list for the route |
| `patient_acceptability` | `risk_elevated` | Changed on swallowability or palatability rather than a specification |
| `line_capability` | `capacity_or_cost` | The existing fill line cannot run the presentation |
| `supplier_lead_time` | `timing` | Material unavailable within the programme window |
| `partner_decision` | `third_party` | Set by the development partner |
| `other` | `other` | Free text required |
