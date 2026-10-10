# Asset renewal prioritisation

| `code` | `class` | Use when |
|---|---|---|
| `scored_to_model` | conformed | Prioritised by the condition and criticality model |
| `condition_data_stale` | evidence_insufficient | Last inspection too old to rely on |
| `inspection_contradicts_model` | evidence_contradicts | Field condition differs from the modelled score |
| `consequence_of_failure` | risk_elevated | Raised on consequence rather than condition |
| `regulatory_obligation` | rule_conflict | Mandated regardless of score |
| `deferred_budget` | capacity_or_cost | Justified, and not funded this period |
| `bundled_with_other_works` | capacity_or_cost | Brought forward to share mobilisation costs |
| `third_party_works` | third_party | Timing set by another authority's programme |
| `other` | other | Free text required |
