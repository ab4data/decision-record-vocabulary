# Reported phishing assessment

**Sector:** security

| `code` | `class` | Use when |
|---|---|---|
| `confirmed_malicious` | `conformed` | Assessed and actioned under the standard playbook |
| `headers_unavailable` | `evidence_insufficient` | Reporter forwarded without the original message |
| `sender_display_mismatch` | `evidence_contradicts` | Display name conflicts with the sending domain |
| `legitimate_but_unusual` | `evidence_contradicts` | Genuine message that resembles a known pattern |
| `targeted_campaign` | `risk_elevated` | Escalated on evidence of targeting |
| `blocklist_rule_applied` | `rule_conflict` | Handled by an existing rule |
| `mail_provider_action` | `third_party` | Takedown depends on the provider |
| `other` | `other` | Free text required |
