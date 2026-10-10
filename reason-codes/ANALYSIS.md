# What 27 domains have in common

**The question this answers:** the proposal says each domain keeps its own table and shares only the words. **So which words, exactly?**

Rather than assert an answer, 27 reason-code lists were written across health, banking, insurance, government, software, research, recruitment, utilities and legal work. Then every value in all of them was classified. **This page is what fell out.**

⚠️ **Read the method note at the bottom before quoting any of this.** These lists were constructed, not collected. The finding is about what structure is *achievable*, not about what real teams currently use.

---

## The corpus

| | |
|---|---|
| Domains | **27** |
| Distinct local codes | **238** |
| Distinct classes needed to describe all of them | ⭐ **11** |
| Codes per domain | 6 to 9, median 8 |

**238 local codes collapse to 11 classes.** That ratio — about twenty-one to one — is the whole argument in a number.

---

## Every class, by how many domains need it

| Class | Codes | Domains | |
|---|---|---|---|
| **`evidence_insufficient`** | 28 | ⭐ **27 / 27** | `████████████████████` 100% |
| **`conformed`** | 27 | ⭐ **27 / 27** | `████████████████████` 100% |
| **`other`** | 27 | ⭐ **27 / 27** | `████████████████████` 100% |
| **`rule_conflict`** | 39 | 23 / 27 | `█████████████████` 85% |
| **`evidence_contradicts`** | 25 | 23 / 27 | `█████████████████` 85% |
| **`authority_exceeded`** | 21 | 21 / 27 | `███████████████` 78% |
| **`risk_elevated`** | 23 | 19 / 27 | `██████████████` 70% |
| `out_of_scope` | 14 | 14 / 27 | `██████████` 52% |
| `third_party` | 14 | 14 / 27 | `██████████` 52% |
| `capacity_or_cost` | 11 | 10 / 27 | `███████` 37% |
| `timing` | 9 | 9 / 27 | `██████` 33% |

**The top seven account for 167 of 214 class-uses — 78%.** In 26 of the 27 domains, at least five of those seven apply. The one exception is freedom-of-information requests, which lean unusually hard on scope and third parties.

---

## ⭐ The finding that matters

> **The portable artefact is the class, not the code.**

A hospital's `collateral_unavailable`, a bank's `income_unverified` and a procurement team's `response_incomplete` are three different words for the same thing. **None of those teams should adopt the others' vocabulary** — the local word is precise, it carries years of shared meaning, and changing it would cost more than it returns.

**What they can share is the class.** So the schema gains one field:

| Field | Who owns it | Cardinality |
|---|---|---|
| `reason_code` | ⭐ **The domain. Stays local, stays in local language** | 6–9 per domain |
| `reason_class` | ⭐ **Conformed. Shared across every domain** | ~11 total |

**That is exactly the conformed-dimension move, applied to reasons.** The fact table keeps its detail; the dimension is agreed once and reused. Nobody gives anything up, and a question can finally be asked across all of them.

---

## Three things worth acting on

### 1. `evidence_insufficient` is in all 27 — so instrument that first

**The single most universal reason a decision departs from the default is that there was not enough to go on.** Every domain examined has at least one code for it; several have two.

That is a useful thing to know before you build anything. **A rising `evidence_insufficient` rate is a data-quality signal, an intake-process signal and a workload signal at once** — and it is the one class you can compare directly with any other team, in any industry, from day one.

### 2. `conformed` is in all 27 — and it is the one people leave out

**Every domain needs a value meaning "the standard applied, nothing unusual happened".**

It feels redundant when you write the list, and it is the most important value in it. **Without it you only ever record exceptions, so you have a numerator and no denominator, and no rate can be calculated.** Several real-world code lists fail here.

### 3. `other` is in all 27 — plan for it rather than against it

**No list of 27 reached full coverage.** Neither did the European Commission's, which carries sixteen categories, seventy keyword specifications, and still needs two separate "other" routes.

**Stop trying to eliminate it. Monitor its rate instead.** Climbing means either the list has stopped fitting the work, or people have stopped caring — and both are worth knowing early.

---

## The long tail is fine

`out_of_scope`, `third_party`, `capacity_or_cost` and `timing` each appear in between a third and a half of domains. **That is not a failure of the scheme.** Eligibility boundaries matter enormously in benefits and planning and barely at all in code review; cost matters in asset renewal and not in ethics review.

> **A conformed dimension does not require every domain to use every value.** It requires them to mean the same thing by the values they do use.

---

## ⚠️ Method, and what this is not

**These 27 lists were written for this exercise, not collected from organisations.** They are informed by how the work is actually done in each field, and they are plausible — but they are constructed, and the same person wrote both the codes and the classes.

**So this demonstrates that the structure is achievable and compact. It does not demonstrate that it matches what any real team uses.** Those are different claims and only the first one is supported here.

⭐ **The way to test it is real lists from real teams.** If your domain's actual codes do not fit these eleven classes, that is the most useful contribution anyone could make — [issue #5](../../issues/5) is open for exactly that, and a class that has to be added is a better result than one that fits.
