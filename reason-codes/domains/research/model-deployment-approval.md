# Model deployment approval

**Sector:** research

| `code` | `class` | Use when |
|---|---|---|
| `meets_validation_criteria` | `conformed` | Performance, fairness and drift checks all passed |
| `validation_data_unrepresentative` | `evidence_insufficient` | Test set does not reflect the deployment population |
| `offline_vs_online_gap` | `evidence_contradicts` | Shadow results differ from offline evaluation |
| `subgroup_performance` | `rule_conflict` | Fails a performance floor for a defined group |
| `explainability_requirement` | `rule_conflict` | Cannot meet the required level of explanation |
| `human_in_loop_required` | `risk_elevated` | Approved only with review on every decision |
| `monitoring_not_ready` | `capacity_or_cost` | Model sound, observability not in place |
| `other` | `other` | Free text required |
