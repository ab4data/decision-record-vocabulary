# Reason codes

**27 starter lists across nine sectors, and an analysis of what they have in common.**

| | |
|---|---|
| ⭐ **[ANALYSIS.md](ANALYSIS.md)** | **Start here.** 238 local codes across 27 domains collapse to 11 shared classes. Three of those appear in every single domain |
| [domains/](domains/) | The 27 lists |
| [domains/_FORMAT.md](domains/_FORMAT.md) | The three-column format, and why there is a `class` column |

---

## The short version

**Nobody adopts anybody else's codes.** A hospital's `collateral_unavailable` and a bank's `income_unverified` mean the same thing in different languages, and both words are right in their own setting.

**What gets shared is the class.** `reason_code` stays local; `reason_class` is conformed. One extra field, and a question can be asked across every domain at once.

---

## Three rules that matter more than the lists

1. ⭐ **Six to eight values.** Fewer says nothing; more and nobody picks accurately. Across all 27 lists the median is eight.
2. ⭐ **Always include a value meaning "nothing unusual happened".** It feels redundant and it is the most important one — without it you record only exceptions, so you have a numerator and no denominator.
3. ⭐ **Always include `other`, with free text, and monitor its rate.** None of the 27 reached full coverage, and neither has the European Commission with seventy keyword specifications.

---

## The sectors covered

**Health** — clinical triage · prescribing review · mental health risk assessment
**Banking and finance** — lending · fraud alerts · AML monitoring · hardship applications
**Insurance** — claims assessment · underwriting
**Government** — planning approvals · grant assessment · benefits eligibility · freedom of information · procurement
**Software and IT** — code review · incident severity · change advisory · defect triage · access requests · service desk
**Research** — human research ethics · academic peer review
**Recruitment** · **Utilities** — safety incidents · asset renewal · **Legal** — contract review · **Platforms** — content moderation

---

## Add yours

**The most useful contribution anyone can make here**, and the lists above are built to be argued with rather than adopted. One file in [`domains/`](domains/), same three columns, or paste a table into [issue #5](../../issues/5) and it will be added with credit.

⭐ **If your real codes do not fit the eleven classes, say so.** A class that has to be added is a better result than one that fits.
