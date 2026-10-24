# The taxonomy

**Four levels. Only the middle two are shared.**

```
  posture     conformed  |  departed                       2 values   shared
      │
  locus       input · rule · judgement · authority          6 values   shared
              resource · external
      │
  class       evidence_insufficient · rule_conflict …      11 values   shared
      │
  code        income_unverified · obs_incomplete …        716 values   LOCAL
```

Derived from 87 domain lists across 18 sectors. The method and the numbers are in [ANALYSIS.md](ANALYSIS.md); the class definitions are in [CLASSES.md](CLASSES.md).

---

## Level 1 — posture

**Did the standard apply, or did something make this one different?**

| Value | Meaning |
|---|---|
| `conformed` | The standard, protocol or policy applied and was followed |
| `departed` | Something made this decision different from the default |

**Two values, and the first one is the one teams forget.** Without a `conformed` value you record only exceptions — a numerator with no denominator, and no rate can be computed. It appears in all 87 domains examined.

---

## ⭐ Level 2 — locus: where the departure came from

**This is the level that earns the hierarchy.** A class tells you *what* happened. The locus tells you **who can do something about it.**

| Locus | Classes | Domains | **Who can fix it** |
|---|---|---|---|
| **`input`** | `evidence_insufficient` · `evidence_contradicts` | **87 / 87** | Whoever owns intake — forms, upstream systems, what gets asked for |
| **`rule`** | `rule_conflict` · `out_of_scope` | **84 / 87** | Whoever owns the policy or the rule set |
| **`judgement`** | `risk_elevated` | 71 / 87 | Training, calibration, worked examples |
| **`resource`** | `capacity_or_cost` · `timing` | 68 / 87 | Funding, staffing, scheduling |
| **`external`** | `third_party` | 57 / 87 | ⚠️ **The lever sits outside the organisation. Manage it rather than plan to fix it** |
| **`authority`** | `authority_exceeded` | 38 / 87 | Whoever sets delegations |

> ⭐ **That last column is the point of the whole exercise.** A reason-code report that says "incomplete documentation is up four points" tells you something happened. A locus roll-up that says **"sixty per cent of departures this quarter were `input`"** tells you to go and fix the form.

---

## Level 3 — class

**Eleven values, defined in [CLASSES.md](CLASSES.md).** Stable: tripling the corpus from 27 domains to 87 required no twelfth class.

## Level 4 — code

**Local, and it stays local.** 716 codes across 87 domains, median eight per domain. A hospital says `collateral_unavailable`, a bank says `income_unverified`, a procurement team says `response_incomplete`. **All three are `evidence_insufficient`, in the `input` locus — and all three words are right where they are used.**

---

## ⚠️ This is a taxonomy, not an ontology

**Worth being precise, because the words get used loosely.**

| | |
|---|---|
| **A taxonomy** is a strict hierarchy of *is-a* relations. A code **is a** class; a class **is in** a locus | ⭐ **That is what this is** |
| **An ontology** also carries other relation types — *part-of*, *causes*, *precedes*, *depends-on* — between entities | **This is not that** |

**There is one genuinely ontological element in the wider schema, and it is `basis_refs`** — a typed, directed edge list where a decision `cited`, `applied`, `assessed` or `supersedes` another record. Those are relations between entities, not classification. **Keep the two ideas apart:** classification tells you what kind of thing a decision was, and the edge list tells you what it rested on.

---

## How to adopt it

1. **Keep your codes.** Do not rename anything.
2. **Add one column: `reason_class`.** Map each existing code to one of the eleven.
3. **Derive `locus` and `posture`** — they are lookups from the class, so they cost nothing to store or compute.
4. **Report at locus level to anyone outside your team, and at code level inside it.**

**Mapping a list of eight codes takes about twenty minutes.** If a code genuinely will not map, [that is the most useful thing you could tell us](../../issues/1).
