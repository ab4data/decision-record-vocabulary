# The machine-readable spec

**Everything in [SCHEMA.md](../SCHEMA.md) stated in a form a program can check.** A prose schema is a proposal; a schema with a validator is something a team can depend on.

**Vocabulary version `0.1.0`.**

---

## What is here

| File | |
|---|---|
| [`decision-record.schema.json`](decision-record.schema.json) | **JSON Schema, draft 2020-12.** The record shape, its enumerated values, and the rules between fields |
| ⭐ [`vocab/`](vocab/) | **Eight controlled vocabularies as CSV**, each with `value,parent,status,definition`. These are the files to load into a dimension table |
| [`PROFILES.md`](PROFILES.md) | **Core, Standard and Full.** Three honest levels, five columns to the first one |
| [`relations.md`](relations.md) | The four `basis_refs` relations, and what each one answers |
| [`VERSIONING.md`](VERSIONING.md) | ⭐ **Values are added, retired, and never redefined.** What each kind of change costs |
| [`build-vocab.pl`](build-vocab.pl) | **Generates every CSV from one table of truth**, and cross-checks it against the 87-domain corpus |
| [`check-spec.pl`](check-spec.pl) | The repository's self-test: schema, vocabularies and worked example must agree |
| ⭐ [`check-profile.pl`](check-profile.pl) | **Point it at your own extract.** It names the profile you reach and what stands between you and the next |

---

## The vocabularies

| File | Values | |
|---|---|---|
| `posture.csv` | 2 | `conformed` · `departed` |
| ⭐ `locus.csv` | 8 | **Who can act on a departure** — the layer that turns a count into an owner |
| ⭐ `reason_class.csv` | 11 | **The column that travels.** 716 local codes across 87 domains collapse to these |
| `worker_kind.csv` | 4 | `person` · `agent` · `deterministic_code` · **`person_with_agent`** |
| `outcome.csv` | 4 | `accepted` · `edited` · `rejected` · `abandoned` |
| `basis_relation.csv` | 4 | `applied` · `assessed` · `cited` · `supersedes` |
| `decision_automation.csv` | 3 | `fully` · `partially` · `not_automated` |
| `detection_automation.csv` | 2 | `yes` · `no` |

**Each CSV carries `parent`, so the four levels are in the data rather than in prose:** posture → locus → reason_class, and under those, the 716 local codes that stay with their domains.

⭐ **Why `locus` matters more than it looks.** A reason class tells you what happened. Its locus tells you **who can do something about it** — `input` is intake, `rule` is the policy owner, `judgement` is calibration, `resource` is funding, `external` is managed rather than fixed, `authority` is delegations. **A count becomes a work item.**

---

## Running the checks

```bash
cd spec
perl build-vocab.pl --check            # the CSVs still match their source
perl check-spec.pl                     # schema, vocabularies and example agree
perl check-profile.pl ../example/decisions.json
```

**Perl and `JSON::PP` are all three need**, and `JSON::PP` ships with Perl. ⭐ **No installation, no lock file, no network** — the point of a spec is that checking it is easier than arguing about it.

```
  ok    schema parses as JSON
  ok    $defs/reason_class          matches vocab/reason_class.csv (11 values)
  ok    every reason_class points at a declared locus
    ok  example: 46 records checked against every rule the schema states

  all checks passed
```

---

## Changing something

**`build-vocab.pl` holds the only copy of every vocabulary**, in a table at the top of the file. Edit that table, run the script, and all eight CSVs are rewritten from it — ⭐ **so the CSVs and the source cannot drift apart.**

`build-vocab.pl --check` rewrites nothing and exits 1 if they have. **That is the one to run in CI**, because it catches a hand-edited CSV, which is the failure mode this arrangement exists to prevent.

**Then bump the version** by the table in [VERSIONING.md](VERSIONING.md), in the same commit.
