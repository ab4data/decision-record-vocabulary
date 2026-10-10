# Pharmacist prescribing review

**Sector:** health

| `code` | `class` | Use when |
|---|---|---|
| `appropriate_as_written` | `conformed` | Dose, route and duration match the guideline |
| `indication_unclear` | `evidence_insufficient` | No documented indication for the medicine |
| `interaction_flagged` | `rule_conflict` | Interacts with an existing medicine |
| `dose_outside_range` | `rule_conflict` | Outside the age, weight or renal range |
| `allergy_conflict` | `rule_conflict` | Conflicts with a recorded allergy |
| `prescriber_contacted` | `authority_exceeded` | Changed only after confirming with the prescriber |
| `supply_unavailable` | `third_party` | Clinically fine, cannot be dispensed |
| `other` | `other` | Free text required |
