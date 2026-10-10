# Trade customer credit hold

**Sector:** retail

| `code` | `class` | Use when |
|---|---|---|
| `within_terms` | `conformed` | Account inside limit and terms |
| `financials_not_supplied` | `evidence_insufficient` | Updated financials not provided |
| `payment_claim_unverified` | `evidence_contradicts` | Claimed remittance not received |
| `limit_exceeded` | `rule_conflict` | Order would exceed the approved limit |
| `deteriorating_indicators` | `risk_elevated` | Held on external credit signals |
| `strategic_account_release` | `authority_exceeded` | Released by a named approver |
| `insurer_withdrew_cover` | `third_party` | Trade credit insurance reduced |
| `other` | `other` | Free text required |
