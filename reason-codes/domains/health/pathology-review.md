# Pathology result review

**Sector:** health

| `code` | `class` | Use when |
|---|---|---|
| `within_reference_range` | `conformed` | Result normal, released without comment |
| `sample_quality_poor` | `evidence_insufficient` | Haemolysis, clotting or insufficient volume |
| `inconsistent_with_history` | `evidence_contradicts` | Result does not fit the clinical picture |
| `critical_value` | `rule_conflict` | Mandatory notification threshold reached |
| `delta_check_failed` | `evidence_contradicts` | Changed too much from the previous result |
| `repeat_requested` | `evidence_insufficient` | Repeat ordered before reporting |
| `referred_pathologist` | `authority_exceeded` | Beyond the scientist release authority |
| `other` | `other` | Free text required |
