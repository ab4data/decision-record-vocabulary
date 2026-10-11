# `basis_refs` — the four relations

**A decision record says what was decided and why. `basis_refs` says what it rested on.**

```json
"basis_refs": [
  {"type": "policy",   "id": "motor-v9",  "rel": "applied"},
  {"type": "claim",    "id": "CL-70412",  "rel": "assessed"},
  {"type": "report",   "id": "rpt-2211",  "rel": "cited"},
  {"type": "decision", "id": "DEC-88120", "rel": "supersedes"}
]
```

Three fields. **`type` and `id` name the thing. `rel` says what part it played.**

---

## Why `rel` earns its place

Without it, a basis list is a bag of identifiers and every edge looks alike. With it, each edge carries its role, and **four different questions become four different queries**:

| Question | Relation |
|---|---|
| *Which decisions used the version of this policy we have just replaced?* | `applied` |
| *How many times has this particular case been judged?* | `assessed` |
| *Which reports are actually being read when people decide?* | `cited` |
| *What did we used to think, and when did that change?* | `supersedes` |

⭐ **That first row is the one that pays for the column.** A policy changes on Tuesday; by Tuesday afternoon you have the list of every decision made under the old wording.

---

## The four relations

### `applied` — the rule that governed it

**The policy, standard, threshold, protocol or guideline that this decision was made under.** Version it if it is versionable: `motor-v9`, not `motor`.

> **Most decisions have exactly one.** Where there are several, record all of them.

### `assessed` — the thing being judged

**The subject matter itself: the claim, the pull request, the application, the patient episode.** This is the thing the decision is *about*.

> ⭐ **This edge is what makes repeat attempts visible.** Three decisions that all `assessed` the same case are three looks at one problem, and the pattern of how those three went is usually more interesting than any one of them.

### `cited` — what was in front of the decider

**Supporting material that informed the call without governing it:** a report, a prior decision, a retrieved document, a dataset, a model output.

> ⭐ **If a judgement runs through a retrieval or tool-using harness, this list already exists.** The harness holds the identifiers of exactly what it put in front of the model at the moment it answered, and ordinarily discards them. **Keeping them is a logging change.**

### `supersedes` — what this replaces

**An earlier decision that this one overrides.** The earlier record stays exactly as it was and is marked, never edited away.

> **This is the move architecture decision records have made since 2011**, and it is the reason those records can be trusted years later: ⭐ **the history is the asset, so nothing is overwritten.**

---

## The shape this makes

Each judged attempt is a node. So is each thing it cited. **Each entry in `basis_refs` is a directed, typed edge between them**, which makes the whole column a **directed acyclic graph**.

**It is acyclic for a reason that needs no enforcing: a decision can only cite something that already existed.** Time supplies the ordering for free.

| | |
|---|---|
| **Storage** | ⭐ **One child table: `decision_id`, `basis_type`, `basis_id`, `rel`.** See [`example/decision_basis.csv`](../example/decision_basis.csv) |
| **Traversal** | A recursive join. ⭐ **No graph database is needed** at the volumes most organisations have |
| **Keys, never copies** | The record holds the identifier. The document stays where it already lives, under whatever controls it already has |

---

## ⚠️ What an edge means, and what it does not

**An edge records what was cited. It does not record what caused the decision.**

This is lineage, and lineage is genuinely useful: it tells you what was available, what was consulted, and what governed. ⭐ **Say "this decision cited that report", never "that report caused this decision"** — and say it that way in the reports you build on it, because the second sentence is the one people will reach for if you let them.

**Causality needs a different design**, and the honest version of it is a trial: change one thing, hold the rest, and see what moves.

---

## Adding a relation

Four is a proposal, not a boundary. **A fifth relation is a useful disagreement** — [open an issue](../../issues) and say which question your existing four cannot answer. The ones most likely to earn a place are a *delegation* edge, naming the authority a decision was made under, and a *contradicted* edge, for material that was in front of the decider and pointed the other way.

**Relations are added, never repurposed.** See [VERSIONING.md](VERSIONING.md).
