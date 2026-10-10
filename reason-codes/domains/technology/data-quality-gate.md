# Data pipeline quality gate

**Sector:** technology

| `code` | `class` | Use when |
|---|---|---|
| `passed_all_checks` | `conformed` | All contract tests passed, load proceeded |
| `source_file_missing` | `evidence_insufficient` | Expected input did not arrive |
| `row_counts_conflict` | `evidence_contradicts` | Reconciliation against source failed |
| `schema_violation` | `rule_conflict` | Contract breached by an upstream change |
| `threshold_breach` | `rule_conflict` | Null or duplicate rate above the agreed limit |
| `stale_data_accepted` | `risk_elevated` | Loaded knowingly stale to keep a deadline |
| `upstream_provider` | `third_party` | Fault sits with the data supplier |
| `other` | `other` | Free text required |
