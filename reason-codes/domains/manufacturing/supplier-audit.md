# Supplier audit outcome

**Sector:** manufacturing

| `code` | `class` | Use when |
|---|---|---|
| `approved_no_findings` | `conformed` | Audit closed with no findings |
| `records_unavailable` | `evidence_insufficient` | Supplier could not produce required records |
| `practice_differs_from_procedure` | `evidence_contradicts` | Observed practice conflicts with documented procedure |
| `major_nonconformity` | `rule_conflict` | A standard requirement not met |
| `single_source_risk` | `risk_elevated` | Rating influenced by dependency |
| `corrective_action_window` | `timing` | Approval conditional on a closure date |
| `subcontractor_scope` | `third_party` | Finding relates to the supplier own supplier |
| `other` | `other` | Free text required |
