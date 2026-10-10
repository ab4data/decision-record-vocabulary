# Card chargeback decision

**Sector:** finance

| `code` | `class` | Use when |
|---|---|---|
| `represented_successfully` | `conformed` | Evidence met the scheme requirement |
| `merchant_evidence_missing` | `evidence_insufficient` | Merchant did not supply within the window |
| `delivery_record_conflicts` | `evidence_contradicts` | Proof of delivery conflicts with the cardholder account |
| `scheme_rule_applies` | `rule_conflict` | Outcome set by a specific scheme rule |
| `reason_code_mismatch` | `rule_conflict` | Dispute filed under the wrong scheme reason |
| `time_limit_expired` | `timing` | Filed or represented outside the scheme window |
| `issuer_decision` | `third_party` | Determined by the issuing bank |
| `other` | `other` | Free text required |
