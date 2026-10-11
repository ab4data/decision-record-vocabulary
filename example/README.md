# A worked example

**The central claim of this repository is that two domains can be compared without merging their tables. This directory is that claim, with data behind it.**

⚠️ **All data here is synthetic.** No real decision data appears anywhere in this repository.

---

## What is here

| File | |
|---|---|
| `claim_assessments.csv` | 25 records. An insurance domain, with **its own reason codes** |
| `code_reviews.csv` | 21 records. A software domain, with **completely different reason codes** |
| `dim_reason_class.csv` | ⭐ **The only thing the two share.** Copied from [`../spec/vocab/reason_class.csv`](../spec/vocab/reason_class.csv), which is the single source |
| `decision_basis.csv` | 92 edges. What each decision applied and assessed |
| `decisions.json` | All 46 records as JSON, for the schema and profile checkers |
| `drill-across.sql` | Three queries. ⭐ **There is no join between the two fact tables anywhere in the file** |
| `expected-output.txt` | ⭐ **The answers, computed rather than asserted** — see the note at the foot of this page |
| `make-example.pl` · `load.sql` | Regenerate the data · load it into a database |

**The 46 records meet the Full profile**, which is what makes this a worked example rather than a sketch:

```
  Core      MET    5 of  5 columns on every record
  Standard  MET   11 of 11 columns on every record
  Full      MET   16 of 16 columns on every record
```

---

## 1 · The point, in one look

**The two tables have nothing in common at the code level:**

| Claim assessments say | Code reviews say | Both are |
|---|---|---|
| `documentation_incomplete` | `test_coverage` | `evidence_insufficient` |
| `valuation_disputed` | `works_as_specified` | `evidence_contradicts` |
| `referred_specialist` | — | `authority_exceeded` |
| — | `security_concern` | `risk_elevated` |

⭐ **Neither team gave up a single word.** Each added one column.

```
locus           claim assessments   code reviews      total
------------------------------------------------------------
none                            9              8         17
input                          10              6         16
rule                            2              3          5
authority                       2              0          2
judgement                       0              2          2
unclassified                    1              1          2
external                        0              1          1
resource                        1              0          1
------------------------------------------------------------
TOTAL                          25             21         46
```

⭐ **Read the `input` row.** Insurance and software, different companies, different words, different systems — and **the largest single source of departures in both is that somebody did not have enough to go on.** That sentence was unavailable to either team on its own, and it points both at the same place: intake.

**That one row is the whole proposal, in a number.**

---

## 2 · What the optional columns add

**25 of the 46 decisions were made by a person working with software, and each of those carries what the software proposed.** So the override rate is a column, not a survey:

```
Of 25 decisions where software proposed and a person decided, the person
changed the proposed outcome 7 times.
```

⭐ **This is the question arriving in every organisation that has put a model in front of a decision**, and it is answerable only from records kept while the decisions were being made.

---

## 3 · What `basis_refs` adds

Every decision carries the identifiers of what it rested on, so the edges roll up:

```
  policy:motor-v9              25
  decision:ADR-0042            21
```

⭐ **That is the list you want on the morning a policy changes** — every decision made under the version you have just replaced, by name, in one query. See [`../spec/relations.md`](../spec/relations.md).

---

## Running it

```bash
duckdb -c ".read load.sql" -c ".read drill-across.sql"
```

Or load the four CSVs into anything at all and run `drill-across.sql`. **The first query uses only joins, `UNION ALL` and `GROUP BY`**, so it runs unchanged on SQLite, MySQL, Postgres, DuckDB, SQL Server, Snowflake and BigQuery.

**Compare what you get with `expected-output.txt`.**

```bash
perl make-example.pl          # regenerate every file in this directory
cd ../spec && perl check-profile.pl ../example/decisions.json
```

---

## ⚠️ A note on the word "runnable"

**The SQL in this directory has not been executed in this repository**, because no database engine was available where it was written. **Saying so is the point** — a project about recording what was actually checked does not get to assert otherwise.

⭐ **What was done instead is stronger than one untested run.** [`make-example.pl`](make-example.pl) performs exactly the roll-ups that `drill-across.sql` describes, in plain Perl, over the same CSVs — and `expected-output.txt` is **its real output**, written by the program rather than typed by hand.

| | |
|---|---|
| **The logic** | ⭐ **Verified.** The reference implementation was run and its output committed |
| **The data** | ⭐ **Verified.** All 46 records pass `check-spec.pl` and reach the Full profile |
| **The SQL text** | ⚠️ **Written and reviewed, not executed.** If it disagrees with `expected-output.txt` in your engine, trust the file and [open an issue](../../issues) |

**That last line is an invitation.** A corrected query, with the engine it was run on, is exactly the contribution this repository wants first.
