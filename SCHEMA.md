# The schema

**Status: a proposal, offered for amendment.** Nothing here is a standard. If a field is wrong for your domain, [say so](../../issues) or change it in a fork — that is what it is for.

> ⭐ **This page is the argument. [`spec/`](spec/) is the same thing a program can check** — JSON Schema, the vocabularies as CSV, [three conformance profiles](spec/PROFILES.md) and a validator you can point at your own extract. **[`example/`](example/) shows it working on 46 records.**

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
| ⭐ `reason_class` | **One of about eleven shared classes — see §4** |
| `decided_at` | When |

⭐ **Note what is *not* in that list: `reason_code` itself.** The code stays in the fact table, in the domain's own language. **It is the class that conforms.** That distinction came out of writing the first 27 of these lists and classifying all 238 values. The corpus is now 96 lists across 22 sectors and 797 codes, and growing it to that size required no twelfth class — see [reason-codes/ANALYSIS.md](reason-codes/ANALYSIS.md). It is the difference between asking every team to adopt a shared vocabulary and asking them to map onto one.

**Seven is a starting proposal.** If you need an eighth, that is a useful disagreement — [open an issue](../../issues).

⭐ **The two shared dimensions ship seeded.** `ddl/postgres.sql` and `ddl/sqlite.sql` create `dim_locus` and `dim_reason_class` **and populate them** — **6 loci and 11 classes**, matching [reason-codes/TAXONOMY.md](reason-codes/TAXONOMY.md) and [reason-codes/CLASSES.md](reason-codes/CLASSES.md). Run either file and you can insert a decision immediately.

⚠️ **Two classes carry no locus, and `dim_reason_class.parent` is nullable for exactly that reason.** A locus records where a **departure** came from: `conformed` is not a departure, and `other` is not yet classified. ⛔ **Neither should be given one to satisfy the column.**

⚠️ **`out_of_scope` is seeded as `provisional`, not `stable`.** It appears in 19 of 96 domains and is the most contestable call in the scheme — the status column says so rather than leaving it implied.

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

⭐ **And the conformed counterpart: `reason_class`.**

Writing the first 27 lists produced **eleven classes**. Extending the corpus to 96 lists across 22 sectors, and 797 codes, required no twelfth class. Three classes appear in every single domain. See [reason-codes/ANALYSIS.md](reason-codes/ANALYSIS.md).

| Field | Who owns it | Cardinality |
|---|---|---|
| `reason_code` | **The domain. Stays local, in local language** | 7–9 per domain |
| `reason_class` | **Conformed, shared across every domain** | ~11 total |

**Nobody adopts anybody else's vocabulary.** A hospital's `collateral_unavailable` and a bank's `income_unverified` are the same class in different words, and both words are right where they are used. **The class is what travels.**

The three classes present in all 96 domains are worth building first: `evidence_insufficient` (the most universal reason anything departs from default), `conformed` (without it there is no denominator and no rate), and `other` (which no list of any size has eliminated).

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
reason_code       valuation_disputed        (local)
reason_class      evidence_contradicts      (conformed)
decide_seconds    95
basis_refs        [policy:motor-v9, claim:CL-70412, report:rpt-2211]
detected_auto     no
decision_auto     partially
decided_at        2026-10-10T04:21:07Z
```

⚠️ **Synthetic.** No real decision data appears anywhere in this repository.

---

## 8. How sure — derived, not declared

⭐⭐ **This section adds no obligation.** Everything below is computed from columns §1–§2 already require. There is nothing extra to record, and nothing for an operator to maintain.

**Why the table can answer it at all.** `standard_set_at` fixes the acceptance criterion **before** the attempt; `outcome` records what happened **after**. Every row is therefore a pre-registered prediction together with its realised result — **a forecast-verification dataset by construction**, not by effort.

**The estimator is one query.** The conformed dimensions *are* the partition. For each cell — `task_type × reason_class × worker_kind` — take `accepted ÷ n`. That share is the probability that the next decision of that kind stands.

```sql
SELECT task_type, reason_class, worker_kind,
       COUNT(*)                                   AS n,
       AVG(CASE WHEN outcome = 'accepted' THEN 1.0 ELSE 0 END) AS rate
FROM   decision_attempt
GROUP  BY 1, 2, 3;
```

⭐ **Calibration is an identity, not an achievement.** The figure quoted for a cell *is* the frequency observed in that cell. In sample that is arithmetic; nobody has to be a well-calibrated judge. Out of sample it holds **while the cell is stable**, and the same rows are what expose the drift. Precision is the binomial interval, which narrows as **1/√n** — so the lower bound rises on volume alone, with no model improving. Use **Wilson or Jeffreys at small n, Agresti–Coull at larger** (Brown, Cai & DasGupta, *Statistical Science*, 2001); the Wald interval is not safe here.

⭐⭐ **And sharpness rises, in a direction that is proved rather than hoped.** Volume buys a finer partition: at first only `task_type` carries the rows, then `× reason_class`, then `× worker_kind`, then `× reason_code`. Resolution is the variance of the conditional mean, so **splitting a cell cannot lower it** — the law of total variance. And among well-calibrated forecasters, the **more refined one is preferred under every strictly proper scoring rule** (DeGroot & Fienberg, 1982 and 1983; refinement is the same ordering called sufficiency in elicitation and sharpness in forecasting). That is *sharpness increasing subject to calibration* — the published definition of a better forecast (Gneiting, Balabdaoui & Raftery, *JRSS-B*, 2007) — obtained as a by-product of keeping the record.

**What to report.** One line per decision path: the **lower bound** of its acceptance rate, by month. It climbs for two reasons at once — the interval narrows as rows accumulate, and the cells refine as volume allows. **When a line clears the threshold you set, that path can run unattended.** This is §6's promotion rule with a number and an interval underneath it.

⭐ **Free supervision as well.** On `person_with_agent` rows, `proposed_outcome` against `outcome` is the agent's accuracy on your own work — the labelled expert decisions that routing research reports it is short of, arriving as a by-product.

⛔ **Seven limits, and all seven belong in any report built on this.**

1. It measures **agreement with the standard you wrote, not ground truth**. A badly chosen standard yields a confident number about the wrong thing.
2. It holds **while a cell is stable**. Drift breaks it, and the record is what shows the break.
3. **A thin cell carries a wide interval.** Quote the bound, never the point.
4. **The interval assumes independent trials.** A batch dispositioned by one assessor, or several exceptions from one customer, are not that many independent draws — **count clusters, not rows**, or use a cluster-robust interval.
5. **Watching many cells at once is multiple testing.** At 95% across two hundred cells, about ten clear the line by chance — raise the bar, require the bound to hold for consecutive periods, or control the false-discovery rate.
6. **Never promote on the `other` cell.** A reference class has to be homogeneous; `other` is mixed by construction, so its rate averages unlike things. The free text it is required to carry is what later splits it into real classes — which is refinement arriving by the front door.
7. **A reclassified code shifts a cell without saying so.** `reason_class` is written on the row at decision time rather than joined at query time, so a remapping **cannot rewrite history** — but new rows then carry a different class from old ones for the same code. **`class_map_version` records which mapping was in force**, so the shift can be explained rather than merely detected.

**An optional `confidence` column exists for one purpose only.** Where a tool already emits a confidence value — OpenAI's Decisions API returns one, separate from its probability distribution, and **does not document how it is computed** — store it so it can be *checked* against the derived rate. It is never the source of the measure, and the schema does not require it.

## 9. What this does not cover

**Decisions that were assembled afterwards out of things that happened** — the boardroom, how a strategy actually got chosen. Fifty years of research describes much organisational choice as streams meeting by timing rather than as a deliberate act at an identifiable moment, and that work is worth taking seriously.

**This schema fits work that was handed out, came back, and was judged against a standard set in advance.** Claim assessments, code reviews, triages, approvals with a threshold. ⭐ **Every decision an agent makes is exactly that shape**, which is why the fastest-growing part of most organisations is the part this fits best. Everything else keeps its own methods.
