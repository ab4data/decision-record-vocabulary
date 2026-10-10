# Instrument calibration decision

**Sector:** manufacturing

| `code` | `class` | Use when |
|---|---|---|
| `in_tolerance` | `conformed` | As-found readings within tolerance |
| `reference_standard_due` | `evidence_insufficient` | Reference standard itself out of date |
| `as_found_vs_as_left` | `evidence_contradicts` | Drift pattern inconsistent with use history |
| `out_of_tolerance_impact` | `rule_conflict` | Out of tolerance, product impact assessment triggered |
| `extended_interval` | `risk_elevated` | Interval changed on observed stability |
| `instrument_replacement_cost` | `capacity_or_cost` | Retired rather than repaired |
| `external_laboratory` | `third_party` | Determined by the calibration laboratory |
| `other` | `other` | Free text required |
