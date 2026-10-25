# What 96 domains have in common

**The question:** the proposal says each domain keeps its own table and shares only the words. **So which words, exactly?**

Rather than assert an answer, **96 reason-code lists were written across 22 sectors** and every value in all of them was classified. This page is what fell out.

⚠️ **Read the method note before quoting any of this.** These lists were constructed, not collected.

---

## The corpus

| | |
|---|---|
| Domains | **96** |
| Sectors | **22** |
| Local codes | **797** |
| Classes needed to describe all of them | ⭐ **11** |
| Codes per domain | 7 to 9, median **8** |

**797 local codes collapse to 11 classes.** Roughly seventy-two to one.

⭐ **And the number that matters most: growing the corpus from 27 domains to 96, and from 18 sectors to 22, required no new class.** The scheme was derived on the first 27 and has held across the next 69 without amendment, including four sectors added after the fact — pharmaceuticals, agriculture, construction and resources. That is the only stability evidence available here, and it is worth more than the ratio.

---

## Every class, by coverage

| Class | Codes | Domains | | Locus |
|---|---|---|---|---|
| **`conformed`** | 96 | ⭐ **96/96** | `████████████████████` 100% | — |
| **`other`** | 96 | ⭐ **96/96** | `████████████████████` 100% | — |
| **`evidence_insufficient`** | 99 | ⭐ **96/96** | `████████████████████` 100% | `input` |
| **`evidence_contradicts`** | 97 | 93/96 | `███████████████████` 97% | `input` |
| **`rule_conflict`** | 111 | 88/96 | `██████████████████` 92% | `rule` |
| **`risk_elevated`** | 80 | 79/96 | `████████████████` 82% | `judgement` |
| **`third_party`** | 66 | 66/96 | `██████████████` 69% | `external` |
| **`capacity_or_cost`** | 55 | 53/96 | `███████████` 55% | `resource` |
| **`timing`** | 39 | 39/96 | `████████` 41% | `resource` |
| **`authority_exceeded`** | 39 | 39/96 | `████████` 41% | `authority` |
| **`out_of_scope`** | 19 | 19/96 | `████` 20% | `rule` |

**Three classes appear in all 96 domains. Six appear in more than 80%.**

---

## ⭐ The hierarchy, and why it earns its place

A flat list of eleven classes would be enough to compare domains. **A second level turns comparison into action.**

Grouping the classes by **where the departure originated** gives six loci — and each one points at a different person:

| Locus | Domains | **Who can act on it** |
|---|---|---|
| `input` | **96/96** | Intake: forms, upstream systems, what gets asked for |
| `rule` | 93/96 | Policy owners |
| `judgement` | 79/96 | Training, calibration, worked examples |
| `resource` | 77/96 | Funding, staffing, scheduling |
| `external` | 66/96 | ⚠️ **The lever sits outside — manage rather than plan to fix** |
| `authority` | 39/96 | Whoever sets delegations |

> **"Incomplete documentation is up four points" is a fact.** **"Sixty per cent of departures this quarter were `input`" is an instruction to go and fix the form.**

Full structure in [TAXONOMY.md](TAXONOMY.md). ⚠️ **It is a taxonomy, not an ontology** — strict *is-a* relations only, and that page explains the difference and where the genuine ontology lives.

---

## Three things worth acting on

### 1. `input` is in all 96 — instrument it first

**Every domain, in every sector, has at least one reason meaning "we did not have enough to go on" or "what we had did not add up".** No other locus is universal.

A rising `input` rate is a data-quality signal, an intake signal and a workload signal at once, **and it is comparable with any other team in any industry from the first week.**

### 2. `conformed` is in all 96, and it is the value people leave out

It feels redundant when you write the list. **Without it you record only exceptions — a numerator with no denominator, and no rate.** Several published code lists fail exactly here.

### 3. `other` is in all 96 — plan for it

**None of the 96 reached full coverage.** Neither has the European Commission, with sixteen categories, seventy keyword specifications, and two separate "other" routes. **Monitor its rate instead of trying to eliminate it.**

---

## ⚠️ What the bigger corpus changed

**Three coverage figures moved substantially between the 27-domain analysis and this one**, which is worth recording because it shows how unreliable the smaller sample was:

| Class | at 27 domains | at 96 domains | |
|---|---|---|---|
| `authority_exceeded` | 78% | **41%** | ⬇ the first 27 over-represented domains with formal escalation |
| `third_party` | 52% | **69%** | ⬆ |
| `out_of_scope` | 52% | **20%** | ⬇ sharply |

⭐ **The eleven classes were stable. Their coverage figures were not.** Treat any single percentage here as indicative; treat the class list itself as the finding.

---

## Where sectors diverge

Six of the twenty-two sectors use all eleven classes: technology, government, people, finance, health and education. The rest omit between one and three.

**The most-omitted class is `out_of_scope`** — absent from manufacturing, retail, security, utilities, media, sport, transport, environment, pharmaceuticals, agriculture, construction and resources. In those settings the question "is this ours to decide?" is usually settled before the decision is logged.

**`authority_exceeded` is absent from justice, sport, transport, environment, agriculture, construction and resources**, where the deciding role is typically defined with its authority already fixed.

> **A conformed dimension does not require every domain to use every value. It requires them to mean the same thing by the values they do use.**

---

## ⚠️ Method, and what this is not

**All 96 lists were written for this exercise by one author.** They are informed by how the work is done in each field and they are plausible, but they are **constructed, not collected** — and the same person wrote the codes and the classes, which is exactly the circularity that would invalidate this as evidence about the world.

**So this shows the structure is achievable, compact and stable under a three-and-a-half-fold expansion, and across four sectors added after the scheme was fixed. It does not show that it matches what any real team uses.** Those are different claims and only the first is supported.

⭐ **The way to test it is real lists from real teams.** [Issue #5](../../issues/5) is open for exactly that. **A class that has to be added would be a better result than another list that fits.**

---

## Reproducing this

```bash
perl analyse.pl        # from github_content_and_instruction/
```

The source data is one line per domain in `domains.tsv`. `build-domains.sh` regenerates every markdown file from it **and writes [`code-to-class.tsv`](code-to-class.tsv), the flat `reason_code` to `reason_class` mapping — one row per code, 797 of them.** That is the file to load into a lookup table; the markdown is for reading. **Edit the data, not the generated files.**
