# A shared vocabulary for decision records

**Seven dimensions and two columns, so that a refund decision, a code review and a clinical note can be compared without ever being merged.**

Dedicated to the public domain under [CC0](LICENSE) — and [here is why](NOTICE.md). Adopt it, fork it, rename it, ignore the parts that do not fit. **It is only worth anything if it is shared.**

---

## The short version

Most organisations can tell you **what** was decided. Far fewer can tell you **why**, and fewer still can tell you **what evidence the decision rested on** — in a form anyone can count.

Those last two are a reason code and a list of identifiers. Together they cost about ten seconds a decision, on data you already handle.

> **`reason_code`** — one value from a short list the domain itself writes.
> **`basis_refs`** — the identifiers of the records that were actually in front of whoever decided.

Add those to one process you already log, agree the definitions with one other team, and you have something neither of you had before: **a way to compare how two different kinds of work actually get decided.**

---

## This has been built before, many times over

The idea is stable and well tested. What has been missing is a shared shape.

⭐ **The five rows below are documented examples, not a count.** They were chosen because they span four decades and five industries — and **two of them are hundreds of implementations on their own.**

| When | Where | What they recorded |
|---|---|---|
| **1988 →** | A hospital system | Clinicians may depart from a care protocol **provided they record why**. Reasons analysed, fed back, protocol changed |
| **1988 →** | A bank | An information-based strategy: test an offer, measure, let the measurement choose the next one |
| **2005 →** | Medical research | Journals will not publish a trial unless it was **registered before the first patient was enrolled** |
| **2011 →** | Software teams | One record per decision; when replaced, the old one is **marked superseded, not deleted**. ⭐ **Counted in 921 public repositories** |
| **2023 →** | European regulation | A structured record for **every content decision**, from 375 platforms, publicly downloadable |

Five working loops, and ⭐ **five different vocabularies for the same idea** — health calls it protocol variance, government calls it a statement of reasons, software calls it an architecture decision record. **That is the only thing standing between them, and it is the cheap thing to fix.**

---

## What is here

| File | What it is |
|---|---|
| **[SCHEMA.md](SCHEMA.md)** | The proposal in prose: what one row stands for, the conformed seven, `reason_code`, `basis_refs`, `worker_kind` |
| ⭐ **[spec/](spec/)** | **The same thing a program can check.** JSON Schema, eight controlled vocabularies as CSV, three conformance profiles, and three validators that need nothing but Perl |
| ⭐ **[example/](example/)** | **Two synthetic domains, 46 records, compared without ever being joined.** The answers are computed by a committed program, not typed in |
| **[ddl/](ddl/)** | Starter tables for SQLite and Postgres, with every rule in the spec written as a `CHECK` |
| ⭐ **[reason-codes/](reason-codes/)** | **87 lists across 18 sectors, and an [analysis](reason-codes/ANALYSIS.md) of what they share.** 716 local codes collapse to 11 classes; three appear in every domain. The lists are constructed, not collected |
| **[CLAIMS.md](CLAIMS.md)** | Every factual claim behind this, with its source and status — including the ones that are argument rather than evidence |
| **[CONTRIBUTING.md](CONTRIBUTING.md)** | How to propose a change, and what a useful disagreement looks like |
| **[deck/](deck/)** | The talk this came from, as a single self-contained HTML file |

---

## Five columns, and you are in

⭐ **[The Core profile is five columns](spec/PROFILES.md)**, and two domains that both reach it can be put on the same chart.

```
decision_id   task_type   decided_at   outcome   reason_class
```

**Point the checker at an extract and it tells you where you stand:**

```bash
cd spec && perl check-profile.pl ../example/decisions.json
```

```
  Core      MET    5 of  5 columns on every record
  Standard  MET   11 of 11 columns on every record
  Full      MET   16 of 16 columns on every record
```

**Perl and `JSON::PP` are all it needs**, and `JSON::PP` ships with Perl. No installation, no network.

---

## What is settled, and what is open

**Settled.** Conformed dimensions are a thirty-year-old, widely used technique. A general provenance standard has been a W3C Recommendation since 2013. Object-centric event logs exist specifically to stop flattening everything to one case notion. **Nothing here needs inventing.**

**Evidenced.** Showing people their own decisions back measurably improves what they do next — a Cochrane review pools 177 studies and finds a **median gain of 2.7% and a mean of 6.2%**, at moderate certainty. **Real, peer-reviewed, and modest.**

⭐ **Open, and the most interesting part.** That evidence covers the *reason* half. For the *basis* half — recording what a judgement rested on — **I could find no controlled trial.** If you know of one, [please say so](../../issues). If you are in a position to run one, that is the gap worth closing.

---

## The ask

1. **Pick one process you already log.** Write down, in one sentence, what a single row stands for.
2. **Write a reason-code list of six to eight values** with the people who do the work. A morning is enough.
3. **Add an outcome column**, judged against a standard written *before* the work.
4. ⭐ **Agree those definitions with one other team — or open a pull request here.** Two teams using the same words is a comparison. Ten is a profession.

---

## Credit where it is due

This assembles other people's work. Intermountain Healthcare on recorded protocol variance; Capital One's information-based strategy; the ICMJE on prospective trial registration; Michael Nygard on architecture decision records; Ralph Kimball on conformed dimensions; the process-mining community on object-centric logs; the W3C provenance working group. **Sources and exact citations are in [CLAIMS.md](CLAIMS.md).**

Compiled by Tony Blanch · [linkedin.com/in/tony-blanch](https://www.linkedin.com/in/tony-blanch/)
