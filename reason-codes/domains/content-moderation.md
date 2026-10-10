# Content moderation

The only list here with a real-world counterpart at scale. The EU transparency database carries sixteen violation categories and seventy keyword specifications, and still needs two "other" routes.

| `code` | `class` | Use when |
|---|---|---|
| `policy_breach_clear` | rule_conflict | Unambiguously against a published rule |
| `policy_breach_contextual` | rule_conflict | Against a rule once context is taken into account |
| `legal_requirement` | rule_conflict | Required by law or a valid order |
| `rights_complaint_upheld` | third_party | A complaint from a rights holder was accepted |
| `no_breach_found` | conformed | Reported, assessed, and left in place |
| `insufficient_context` | evidence_insufficient | Could not be judged on the material available |
| `escalated_specialist` | authority_exceeded | Beyond the reviewer's authority |
| `other` | other | Free text required |
