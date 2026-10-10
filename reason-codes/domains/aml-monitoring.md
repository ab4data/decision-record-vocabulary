# AML transaction monitoring

| `code` | `class` | Use when |
|---|---|---|
| `expected_activity` | conformed | Consistent with the known customer profile |
| `kyc_gap` | evidence_insufficient | Customer information incomplete or stale |
| `source_of_funds_unclear` | evidence_insufficient | Could not establish where the money came from |
| `profile_mismatch` | evidence_contradicts | Activity inconsistent with stated occupation or purpose |
| `structuring_indicators` | rule_conflict | Pattern matches a structuring typology |
| `sanctions_or_pep` | rule_conflict | Screening match drove the outcome |
| `jurisdiction_risk` | risk_elevated | Counterparty geography drove the rating |
| `reported_to_regulator` | authority_exceeded | Escalated to the regulator; decision no longer local |
| `other` | other | Free text required |
