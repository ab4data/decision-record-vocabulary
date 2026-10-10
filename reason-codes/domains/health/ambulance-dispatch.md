# Ambulance dispatch prioritisation

**Sector:** health

| `code` | `class` | Use when |
|---|---|---|
| `dispatched_to_protocol` | `conformed` | Call scored to the dispatch protocol and resourced accordingly |
| `caller_detail_limited` | `evidence_insufficient` | Caller could not describe the patient condition |
| `scene_differs_from_call` | `evidence_contradicts` | Crew found a different situation from the one reported |
| `deterioration_risk` | `risk_elevated` | Upgraded on likely trajectory rather than current state |
| `no_resource_available` | `capacity_or_cost` | Priority correct, nearest resource committed elsewhere |
| `referred_secondary_triage` | `authority_exceeded` | Passed to a clinician for a higher-level decision |
| `other_agency_lead` | `third_party` | Police or fire is the lead agency |
| `other` | `other` | Free text required |
