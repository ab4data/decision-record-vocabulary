# Anti-doping result management

**Sector:** sport

| `code` | `class` | Use when |
|---|---|---|
| `negative_no_action` | `conformed` | Sample negative, no further action |
| `sample_chain_of_custody` | `evidence_insufficient` | Documentation package incomplete |
| `a_sample_vs_b_sample` | `evidence_contradicts` | Confirmation sample does not support the screen |
| `adverse_analytical_finding` | `rule_conflict` | Prohibited substance above threshold |
| `therapeutic_use_exemption` | `rule_conflict` | Valid exemption in place |
| `whereabouts_pattern` | `risk_elevated` | Action on a pattern of missed tests |
| `laboratory_or_federation` | `third_party` | Determined by the accredited laboratory or federation |
| `other` | `other` | Free text required |
