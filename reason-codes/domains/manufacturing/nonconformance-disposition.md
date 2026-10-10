# Nonconformance disposition

**Sector:** manufacturing

| `code` | `class` | Use when |
|---|---|---|
| `conforms_on_recheck` | `conformed` | Recheck confirmed the item meets specification |
| `measurement_uncertainty` | `evidence_insufficient` | Result within the uncertainty of the method |
| `sample_vs_batch` | `evidence_contradicts` | Sample result does not represent the batch |
| `use_as_is_concession` | `rule_conflict` | Released against specification under a concession |
| `safety_critical_characteristic` | `risk_elevated` | Scrapped on criticality rather than magnitude |
| `rework_cost` | `capacity_or_cost` | Scrapped because rework exceeds value |
| `customer_concession` | `third_party` | Disposition agreed with the customer |
| `other` | `other` | Free text required |
