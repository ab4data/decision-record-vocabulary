# Starter tables

**Two dialects of the same four tables.** Copy one, rename the fact table, and you have somewhere to put decisions on Monday.

| | |
|---|---|
| [`sqlite.sql`](sqlite.sql) | ⭐ **Start here.** SQLite is already on your machine, and a year of one team's decisions is a file you can email |
| [`postgres.sql`](postgres.sql) | The same shape, with `timestamptz` and named constraints |

---

## The four tables

| Table | One row per |
|---|---|
| `dim_locus` · `dim_reason_class` | ⭐ **The conformed dimensions.** Load them from [`../spec/vocab/`](../spec/vocab/). **Every domain points at the same copy** |
| `claim_assessments` | **One judged attempt.** Rename it for your domain |
| `decision_basis` | **One edge.** What a decision applied, assessed, cited or superseded |

⭐ **A second domain gets its own fact table, not a shared one.** Its own name, its own `task_type` values, its own `reason_code` list. **The two meet in `dim_reason_class` and nowhere else** — that is the whole architecture, and it is the reason neither team has to give up its own words.

---

## What the constraints are doing

**Every rule the schema states is a `CHECK` here**, so the data cannot go wrong quietly:

| Constraint | Why |
|---|---|
| ⭐ `standard_set_at <= decided_at` | **The standard was written before the work.** This is the single strongest idea in the whole proposal, and a constraint makes it true rather than intended |
| `reason_class <> 'other' OR reason_text IS NOT NULL` | An `other` rate you cannot investigate tells you nothing |
| `proposed_outcome IS NULL OR worker_kind = 'person_with_agent'` | A proposal only means something where software proposed and a person then decided |
| `UNIQUE (task_id, attempt)` | **The grain, enforced.** One row per judged attempt, and a task attempted three times is three rows |

**Two indexes earn their keep.** `decision_basis (basis_type, basis_id, rel)` answers *which decisions applied the policy version we just replaced* without a scan — ⭐ **that query is the reason the basis table exists.** And `(reason_class)` on each fact table keeps the drill-across cheap as the row count grows.

---

## Loading the vocabularies

```bash
sqlite3 decisions.db < ddl/sqlite.sql
sqlite3 decisions.db ".mode csv" ".import --skip 1 spec/vocab/locus.csv dim_locus"
sqlite3 decisions.db ".mode csv" ".import --skip 1 spec/vocab/reason_class.csv dim_reason_class"
```

**Reload them whenever the vocabulary version changes**, and record which version an extract was built under. [VERSIONING.md](../spec/VERSIONING.md) says why that one line of metadata is worth keeping.

---

## ⚠️ Not executed here

**These two files were written without a database to run them against**, so they carry the same label as the SQL in [`../example/`](../example/): read, reviewed, and not executed in this repository.

**What has been executed** is the reference implementation in [`../example/make-example.pl`](../example/make-example.pl), which produces the data these tables are shaped to hold and computes the answers in [`expected-output.txt`](../example/expected-output.txt).

⭐ **If a statement here fails in your engine, [say so in an issue](../../issues)** — with the error, and the dialect. That is a contribution, and it is the fastest way these files become dependable.
