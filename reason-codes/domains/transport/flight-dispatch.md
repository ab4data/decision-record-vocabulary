# Flight dispatch release

**Sector:** transport

| `code` | `class` | Use when |
|---|---|---|
| `released_to_plan` | `conformed` | Aircraft, crew, fuel and weather all within limits |
| `forecast_uncertain` | `evidence_insufficient` | Destination forecast does not support a decision |
| `load_sheet_discrepancy` | `evidence_contradicts` | Final load differs from the planning figures |
| `minimum_equipment_list` | `rule_conflict` | Released under a specific MEL item |
| `alternate_required` | `risk_elevated` | Additional alternate carried on assessed risk |
| `crew_duty_limits` | `rule_conflict` | Duty time shaped the decision |
| `slot_or_atc` | `third_party` | Departure set by air traffic flow management |
| `other` | `other` | Free text required |
