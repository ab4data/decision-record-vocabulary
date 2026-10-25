# Construction defect disposition

**Sector:** construction

| `code` | `class` | Use when |
|---|---|---|
| `no_defect_found` | `conformed` | Inspection confirmed the work meets specification |
| `as_built_records_missing` | `evidence_insufficient` | Cannot establish what was actually installed |
| `test_result_disputed` | `evidence_contradicts` | An independent test disagrees with the contractor result |
| `tolerance_exceeded` | `rule_conflict` | Outside the specified tolerance |
| `safety_critical_element` | `risk_elevated` | Rectified on criticality rather than magnitude |
| `rectification_cost` | `capacity_or_cost` | Accepted because rework exceeds the benefit |
| `handover_date` | `timing` | The disposition was shaped by the handover date |
| `client_accepted` | `third_party` | The client accepted the work as it stands |
| `other` | `other` | Free text required |
