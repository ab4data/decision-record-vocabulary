# Reason codes

**87 domain lists across 18 sectors, 716 codes, and the shared vocabulary that falls out of them.**

| | |
|---|---|
| ⭐ **[ANALYSIS.md](ANALYSIS.md)** | **Start here.** What 87 domains have in common, and what changed when the corpus tripled |
| ⭐ **[TAXONOMY.md](TAXONOMY.md)** | The four levels — posture, locus, class, code — and which two are shared |
| **[CLASSES.md](CLASSES.md)** | The eleven classes, defined, with coverage |
| [domains/](domains/) | The 87 lists, by sector |

---

## The short version

**Nobody adopts anybody else's codes.** A hospital's `collateral_unavailable`, a bank's `income_unverified` and a procurement team's `response_incomplete` mean the same thing in three languages, and each word is right where it is used.

**What gets shared is the class, and the locus above it.**

```
posture    conformed | departed                    2    shared
locus      input · rule · judgement · authority    6    shared
           resource · external
class      evidence_insufficient · rule_conflict  11    shared
code       income_unverified · obs_incomplete    716    LOCAL
```

⭐ **The locus is the level that pays.** A class tells you what happened. The locus tells you **who can fix it** — `input` means go and fix the form, `external` means manage it rather than plan to fix it.

---

## Three rules that matter more than the lists

1. ⭐ **Six to eight values.** Across all 87 lists the median is eight.
2. ⭐ **Always include a value meaning "nothing unusual happened".** It feels redundant and it is the one people leave out — without it you have a numerator and no denominator.
3. ⭐ **Always include `other`, with free text, and monitor its rate.** None of the 87 reached full coverage, and neither has the European Commission with seventy keyword specifications.

---

## The 18 sectors

**health** (10) · **government** (11) · **finance** (9) · **technology** (8) · **transport** (5) · **utilities** (5) · **education** (4) · **justice** (4) · **manufacturing** (4) · **people** (4) · **research** (4) · **retail** (4) · **environment** (3) · **media** (3) · **security** (3) · **insurance** (2) · **legal** (2) · **sport** (2)

---

## Add yours

⭐ **The most useful contribution anyone can make.** One line in [`domains.tsv`](domains.tsv), or paste a table into [issue #5](../../issues/5).

**If your real codes will not map onto the eleven classes, say so** — [issue #1](../../issues/1). A class that has to be added is a better result than another list that fits.

## Regenerating

```bash
bash build-domains.sh   # domains.tsv -> domains/<sector>/<domain>.md
perl analyse.pl         # the numbers in ANALYSIS.md
```

**Edit `domains.tsv`, not the generated files.**
