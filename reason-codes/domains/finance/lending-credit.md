# Consumer lending decision

**Sector:** finance

| `code` | `class` | Use when |
|---|---|---|
| `within_policy` | `conformed` | Meets serviceability and credit policy |
| `income_unverified` | `evidence_insufficient` | Income evidence missing or not acceptable |
| `declared_vs_observed` | `evidence_contradicts` | Declared expenses conflict with transaction data |
| `serviceability_shortfall` | `rule_conflict` | Fails the buffer calculation |
| `adverse_credit_history` | `rule_conflict` | Default or arrears within the policy window |
| `security_insufficient` | `rule_conflict` | Valuation or security does not support the amount |
| `product_not_eligible` | `out_of_scope` | Applicant or purpose is outside the product |
| `referred_credit_officer` | `authority_exceeded` | Beyond the delegated lending authority |
| `other` | `other` | Free text required |
