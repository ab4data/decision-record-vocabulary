# The schema

**Status: a proposal, offered for amendment.** Nothing here is a standard. If a field is wrong for your domain, [say so](../../issues) or change it in a fork — that is what it is for.

---

## 1. What one row stands for

Every table answers this question quietly, and it is the most expensive thing to change later.

| Grain | Table |
|---|---|
| One row per order | One table |
| One row per line item | A different table — different counts, different totals, different questions |
| ⭐ **One row per judged attempt** | **This one** |

**A judged attempt is work that was handed out, came back, and was judged against a standard written before the work started.**

- **Not one row per task.** A task can be attempted three times.
- **Not one row per model call.** A call is not a judgement.

> ⭐ **The standard is written when the task is created, not discovered by looking at last month.** Medical research has required exactly this since 2005: register what you will measure, before you measure it. It costs nothing and it is the strongest single idea here.

---

## 2. The conformed seven

**You do not share the table. You share the dimensions.** Each domain keeps its own fact table at its own natural grain; what is agreed is this small set. Conform these and a refund becomes comparable to a code review **without the two ever being merged**.

| Dimension | What it holds |
|---|---|
| `decided_by` | Who or what made the call |
| ⭐ `worker_kind` | **Four values — see §3** |
| `task_type` | What kind of work this was, from a list your domain writes |
| `data_class` | How sensitive the material was |
| `outcome` | `accepted` · `edited` · `rejected` · `abandoned` |
| ⭐ `reason_code` | **One value from a short list — see §4** |
| `decided_at` | When |

**Seven is a starting proposal.** If you need an eighth, that is a useful disagreement — [open an issue](../../issues).

---

## 3. `worker_kind` — four values, not two

```
person | agent | deterministic_code | person_with_agent
```

**It is not person-or-machine.** The fourth value is most of the work in most organisations within two years, and it is the one most often left out of schemas.

⭐ **And `agent` is not one worker.** Coding assistants now ship model pickers and automatic routers, so *which model answered* is a choice software made on your behalf. If you can capture it, do — it is a dimension today and it will be a question later.

---

## 4. `reason_code` — a tick-box, not an essay

**One value from a list of six to eight that the domain itself writes**, plus an optional free-text sentence.

Without it: *"acceptance fell four points."*
With it: *"and two thirds of the new rejections are incomplete documentation, on one task type."*

> **A rate becomes a mechanism.** That is the whole value of the column.

⭐ **Expect to need an "other", and monitor its rate rather than trying to eliminate it.** The EU's content-decision register offers sixteen violation categories and seventy keyword specifications — written by the European Commission, with lawyers, over years — and it *still* carries both an "other" category and an "other" keyword with a 500-character free-text box. **If they need one, so will you.** A climbing "other" rate tells you the list has stopped fitting, or that people have stopped caring. Both are worth knowing.

Starter lists per domain are in [reason-codes/](reason-codes/).

---

## 5. `basis_refs` — keys, not copies

**A list of identifiers: the records that were actually in front of whoever decided.**

```json
"basis_refs": [
  {"type": "policy",   "id": "motor-v9",    "rel": "applied"},
  {"type": "claim",    "id": "CL-70412",    "rel": "assessed"},
  {"type": "report",   "id": "rpt-2211",    "rel": "cited"},
  {"type": "decision", "id": "DEC-88120",   "rel": "supersedes"}
]
```

**Each identifier is an edge.** Each judged attempt is a node; so are the things it cited. So the column is **a directed, typed, acyclic edge list** — it cannot contain a cycle, because a decision can only cite what already existed.

**Two columns and a type. Traversal is a recursive join.** No graph database is needed at the volumes most organisations have.

> **`rel: "supersedes"` is the same move architecture decision records have made since 2011** — the replaced record is kept and marked, never edited away.

⚠️ **An edge records what was cited, not what caused the decision.** This is lineage, not causality. Say so when you report on it.

### Where the list comes from, for free

If a judgement runs through a retrieval or tool-using harness, **the harness already holds the identifiers of exactly what it put in front of the model** at the moment it answers. That list exists in memory and is ordinarily discarded. **Capturing it is a logging change, not a research project.**

---

## 6. How automation is recorded

**Keep detection and decision as two separate fields.** The EU register does this and it is worth copying:

```
detected_automatically = yes | no
decision_automation    = fully | partially | not_automated
```

One boolean would lose the distinction between *"a machine found it and a person judged it"* and *"a machine did both"* — which is the difference that matters most when something goes wrong.

---

## 7. A worked row

```
task_type         claims.decision
worker_kind       agent
attempt           2
outcome           edited
reason_code       valuation_disputed
decide_seconds    95
basis_refs        [policy:motor-v9, claim:CL-70412, report:rpt-2211]
detected_auto     no
decision_auto     partially
decided_at        2026-10-10T04:21:07Z
```

⚠️ **Synthetic.** No real decision data appears anywhere in this repository.

---

## 8. What this does not cover

**Decisions that were assembled afterwards out of things that happened** — the boardroom, how a strategy actually got chosen. Fifty years of research describes much organisational choice as streams meeting by timing rather than as a deliberate act at an identifiable moment, and that work is worth taking seriously.

**This schema fits work that was handed out, came back, and was judged against a standard set in advance.** Claim assessments, code reviews, triages, approvals with a threshold. ⭐ **Every decision an agent makes is exactly that shape**, which is why the fastest-growing part of most organisations is the part this fits best. Everything else keeps its own methods.
