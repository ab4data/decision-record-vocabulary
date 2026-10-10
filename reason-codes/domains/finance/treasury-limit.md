# Treasury limit breach disposition

**Sector:** finance

| `code` | `class` | Use when |
|---|---|---|
| `within_approved_limit` | `conformed` | Exposure inside the mandate |
| `position_data_stale` | `evidence_insufficient` | Valuation feed delayed at the time of check |
| `system_vs_manual_gap` | `evidence_contradicts` | Reported position differs from the trader record |
| `hard_limit_breached` | `rule_conflict` | Mandated limit exceeded |
| `market_move_passive` | `third_party` | Breach caused by price movement, not by trading |
| `temporary_approved_excess` | `authority_exceeded` | Excess approved by a named officer |
| `close_out_cost` | `capacity_or_cost` | Held because unwinding costs more than the exposure |
| `other` | `other` | Free text required |
