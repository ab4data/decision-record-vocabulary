# Code review

| `code` | `class` | Use when |
|---|---|---|
| `meets_standard` | conformed | Approved with no substantive change requested |
| `correctness_risk` | rule_conflict | A defect or an unhandled case |
| `test_coverage` | evidence_insufficient | Plausible but untested |
| `readability` | rule_conflict | Correct, and the next person will struggle |
| `scope_creep` | out_of_scope | Does more than the ticket asked |
| `security_concern` | risk_elevated | Introduces or fails to close an exposure |
| `architecture_mismatch` | rule_conflict | Conflicts with an existing decision — cite it in `basis_refs` |
| `other` | other | Free text required |
