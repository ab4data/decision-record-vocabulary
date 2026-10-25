# The eleven classes

**The conformed vocabulary.** Each class carries its locus (see [TAXONOMY.md](TAXONOMY.md)) and its coverage across the 87-domain corpus.

| Class | Locus | Domains | Use when |
|---|---|---|---|
| ⭐ **`conformed`** | — | **87/87** | The standard, protocol or policy applied and was followed. **Every list needs this value** |
| ⭐ **`evidence_insufficient`** | `input` | **87/87** | There was not enough to go on — missing, incomplete, unreadable, unverifiable or not yet available |
| ⭐ **`other`** | — | **87/87** | None of the above. **Free text required, and the rate is monitored** |
| **`evidence_contradicts`** | `input` | 84/87 | What was supplied conflicts with something else that is known |
| **`rule_conflict`** | `rule` | 79/87 | A specific rule, policy, threshold or standard was breached or engaged |
| **`risk_elevated`** | `judgement` | 71/87 | An assessment of risk, consequence or trajectory drove the outcome, rather than a rule |
| **`third_party`** | `external` | 57/87 | The outcome was determined by someone outside the deciding organisation |
| **`capacity_or_cost`** | `resource` | 44/87 | Resources, budget, volume or cost-to-serve shaped the decision |
| **`authority_exceeded`** | `authority` | 38/87 | Beyond the decider's delegation; referred, escalated or stood aside |
| **`timing`** | `resource` | 31/87 | A deadline, window, sequence or statutory clock shaped the outcome |
| **`out_of_scope`** | `rule` | 19/87 | The matter does not fall within the boundary of what is being decided |

---

## Three distinctions worth getting right

**`evidence_insufficient` vs `evidence_contradicts`.** *Not enough* versus *does not add up*. Different remedies: the first means ask for more, the second means reconcile. Together they are the `input` locus, present in all 96 domains.

**`rule_conflict` vs `out_of_scope`.** *It is ours and it breaches a rule* versus *it is not ours to decide*. ⚠️ `out_of_scope` is the weakest class in the corpus at 22% coverage, and a reasonable reviewer could argue it collapses into `rule_conflict`. It is kept separate because the remedies differ — one changes the rule, the other changes the boundary — but **this is the most contestable call in the scheme** and [issue #1](../../issues/1) is the place to argue it.

**`rule_conflict` vs `risk_elevated`.** *A rule decided it* versus *a person judged it*. This one matters more than it looks: a rising `risk_elevated` rate means people are increasingly deciding outside the written rules, which is either good judgement or an out-of-date rule set. **Either way you want to know.**

---

## Adding a twelfth

**Growing the corpus from 27 domains to 96, across 22 sectors, required no new class.** That is weak evidence of sufficiency rather than proof — all 96 lists were written by one author.

⭐ **A genuine twelfth class would be a better outcome than another list that fits.** If your domain has a reason that will not map, [open issue #1](../../issues/1) with the code and the sentence a practitioner reads when they pick it.
