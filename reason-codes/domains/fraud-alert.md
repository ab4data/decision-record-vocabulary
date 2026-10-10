# Fraud alert disposition

| `code` | `class` | Use when |
|---|---|---|
| `genuine_confirmed` | conformed | Confirmed legitimate; alert closed |
| `customer_uncontactable` | evidence_insufficient | Could not reach the customer within the window |
| `behaviour_inconsistent` | evidence_contradicts | Activity does not match the established pattern |
| `known_fraud_pattern` | rule_conflict | Matches a documented typology |
| `device_or_location_risk` | risk_elevated | Signal risk drove the hold rather than the amount |
| `low_value_accepted` | capacity_or_cost | Risk accepted because pursuit costs more than exposure |
| `referred_investigations` | authority_exceeded | Escalated beyond the analyst's authority |
| `merchant_dispute` | third_party | Resolution sits with the merchant or scheme |
| `other` | other | Free text required |
