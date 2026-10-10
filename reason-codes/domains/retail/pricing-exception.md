# Pricing exception approval

**Sector:** retail

| `code` | `class` | Use when |
|---|---|---|
| `within_price_band` | `conformed` | Discount inside the standard band |
| `margin_data_unavailable` | `evidence_insufficient` | Cost to serve not known at decision time |
| `quoted_vs_system` | `evidence_contradicts` | Quoted price conflicts with the system price |
| `below_floor_price` | `rule_conflict` | Below the approved floor |
| `competitive_response` | `risk_elevated` | Approved to defend an account |
| `volume_commitment` | `capacity_or_cost` | Granted against a committed volume |
| `distributor_agreement` | `third_party` | Set by a channel agreement |
| `other` | `other` | Free text required |
