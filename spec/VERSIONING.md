# Versioning the vocabulary

**Current version: `0.1.0`.** It is declared in [`build-vocab.pl`](build-vocab.pl), which is the single place it is written down.

⭐ **The promise this page makes: a value that has been published keeps its meaning for as long as the vocabulary exists.** Everything below is the machinery for keeping that promise.

---

## Why a vocabulary needs its own version

Historical data is judged by the definitions in force when it was recorded. **Change what a value means and every chart drawn before the change quietly becomes wrong** — with no error, no warning, and no way to tell from the numbers.

So the rule is the oldest one in data management, and it is worth stating plainly:

> ⭐ **Values are added. Values are retired. Values are never redefined.**

---

## What each kind of change costs

| Change | Version | What a user has to do |
|---|---|---|
| Improve a definition's wording, leaving its meaning intact | `0.1.0` → `0.1.1` | **Nothing** |
| Add a new value | `0.1.0` → `0.2.0` | **Nothing.** Old data stays valid and keeps meaning what it meant |
| Mark a value `deprecated` | `0.1.0` → `0.2.0` | **Nothing yet.** Stop using it in new records, and read the mapping offered |
| Remove a deprecated value, or change what one means | `0.1.0` → `1.0.0` | ⚠️ **Re-map historical data, or state which version each extract was recorded under** |

**Adding is cheap. Removing is expensive. Redefining is the one to refuse**, and the reason for the `status` column.

---

## The `status` column

Every vocabulary CSV in [`vocab/`](vocab/) carries `value,parent,status,definition`.

| Status | Meaning |
|---|---|
| ⭐ `stable` | **Published, and its meaning will not change.** Safe to store and to build on |
| `provisional` | Published and usable, and **may be merged into another value in a future minor version.** A mapping will be given |
| `deprecated` | Still valid in historical data, **not to be used in new records.** The replacement is named in its definition |

**One value is `provisional` today:** `out_of_scope`. It has the lowest coverage across the 87-domain corpus and may yet fold into `rule_conflict`. ⭐ **Saying so in the data is better than saying it in a footnote** — a tool can read the `status` column and warn; a tool cannot read a footnote.

---

## Recording the version you used

**Carry the vocabulary version alongside the extract, not inside every row.** A manifest beside the data, a column on the load table, or a note in the dataset description all work:

```
vocabulary_version = 0.1.0
```

⭐ **This is the whole insurance policy.** When a value is eventually retired, an extract that states its version can be re-mapped mechanically. An extract that does not must be re-mapped by somebody who remembers, and memory is the part that does not scale.

---

## How a change actually happens

1. **[Open an issue](../../issues)** naming the question your current values cannot answer. The corpus held at 11 classes across 87 domains, so a twelfth needs to show what the eleven miss.
2. **The change is made in one place:** the `%VOCAB` table at the top of [`build-vocab.pl`](build-vocab.pl).
3. **`perl build-vocab.pl` rewrites every CSV** from that table, so the CSVs and the source cannot drift.
4. **`perl check-spec.pl` must pass.** It compares every enum in the JSON Schema against its CSV, and re-checks the worked example against every rule.
5. **The version is bumped in the same commit**, by the table above.

```bash
cd spec
perl build-vocab.pl          # rewrite the CSVs from the source table
perl build-vocab.pl --check  # verify without writing; exits 1 on drift
perl check-spec.pl           # schema, vocabularies and example must agree
```

⭐ **`--check` is the one to put in CI.** It fails if anybody edits a CSV by hand, which is exactly the silent drift this page exists to prevent.

---

## Local extensions

**Your `reason_code` list is yours and is not versioned here.** Add to it, rename within it, retire from it — the only thing this vocabulary asks is that each of your codes maps to a published `reason_class`.

**Keep that mapping as data in your own repository**, with a date on each row. ⭐ **When a code's class changes, add a row rather than editing one** — then a chart drawn last year can still be reproduced, which is the same promise this page makes, made at your end.
