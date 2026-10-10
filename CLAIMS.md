# Claims register

**Every factual claim behind this proposal, with its source and its status.** Checked 10 October 2026.

A public register of what can and cannot be evidenced is unusual, and it is deliberate. **If you find an error here, [open an issue](../../issues)** — three claims have already been withdrawn from this material after exactly that kind of challenge, and they are listed at the bottom.

**Status key**

| | |
|---|---|
| **Verified** | Checked at a primary or peer-reviewed source |
| **Reported** | Analyst, vendor or practitioner source. Said as such, every time |
| **Derived** | Arithmetic on verified inputs |
| **Assumption** | An argument, announced as one |

---

## The precedents

| # | Claim | Status | Source |
|---|---|---|---|
| **P1** | A hospital system has, **since 1988**, let clinicians depart from a care protocol provided they record why — reasons analysed, fed back, protocol changed | **Verified** | James & Savitz, *How Intermountain trimmed health care costs through robust quality improvement efforts*, **Health Affairs 30(6):1185–91 (2011)**, [doi:10.1377/hlthaff.2011.0358](https://doi.org/10.1377/hlthaff.2011.0358) |
| **P2** | One such protocol is reported to save about **US$50m a year in Utah** | **Reported** — the authors' estimate inside a peer-reviewed paper, not an independent audit | Same paper |
| **P3** | A bank describes **"the proprietary information-based strategy we created in 1988"** with a test-measure-adjust operating model | **Verified** | Capital One annual reports, their own wording |
| **P4** | ⭐ Medical journals require registration in a public registry **at or before the first patient is enrolled**, for trials starting after **1 July 2005** | **Verified** | ICMJE clinical-trial registration policy |
| **P5** | Architecture decision records: one record per decision with context, decision and consequences, and a **superseded** status pointing back at what it replaced | **Verified** | Nygard's 2011 format, [adr.github.io](https://adr.github.io/) |
| **P6** | **375 platforms** file a structured record for every content decision in Europe; **more than 1.5 billion records in the 50 days to 8 October 2026**; about 30 million a day; **139,200,845 on the busiest day**, which is 133.5 GB of CSV | **Verified — counted** | Platform count read from the live filter; volumes summed from the official daily download index at [transparency.dsa.ec.europa.eu](https://transparency.dsa.ec.europa.eu/explore-data/download) |
| **P7** | An audit of that database's first 100 days analysed **353.12 million records** from the eight largest EU social media platforms | **Verified** | Trujillo, Fagni & Cresci, **CSCW'25**, [arXiv:2312.10269](https://arxiv.org/abs/2312.10269) |

---

## The evidence on whether it helps

| # | Claim | Status | Source |
|---|---|---|---|
| **E1** | ⭐⭐ Showing people their own decisions back improves what they do next: **median gain under 3 in 100, mean about 6 in 100**, moderate certainty, pooled across **177 studies** | **Verified** | Cochrane, Ivers et al., *Audit and feedback: effects on professional practice*, [CD000259.pub4 (2025)](https://doi.org/10.1002/14651858.CD000259.pub4). Median 2.7% (IQR 0.0–8.6); mean 6.2% (95% CI 4.1–8.2); OR 1.47 |
| **E2** | The gain is larger where baseline performance is poor, and where feedback comes from a colleague rather than a system | **Verified** | Same review, meta-regression. ⚠️ The 2025 update found repeated delivery associated with a *smaller* effect, against expectation |
| **E3** | Organisations genuinely practising data-driven decision making showed output and productivity **5–6% above** what their technology investment predicted | **Verified** | Brynjolfsson, Hitt & Kim, *Strength in Numbers* (2011), [SSRN 1819486](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1819486) |
| ⭐ **E4** | **No controlled trial of decision quality with and without a `basis_refs` record could be found** | **Verified as a bounded search result** | The open question. [Tell us if one exists](../../issues) |

---

## Why adoption has been slow

| # | Claim | Status | Source |
|---|---|---|---|
| **A1** | Asked what was stopping them, about **3,000 executives and analysts** across 30+ industries and 100+ countries said: **almost four in ten** did not know how to use analytics to improve the business · **more than one in three** had no management bandwidth · **nearly three in ten** lacked skills in the business lines · **about one in five** a culture that does not share. **Data quality and technology ranked below all four** | **Verified** | LaValle, Lesser, Shockley, Hopkins & Kruschwitz, **MIT Sloan Management Review 52(2):21–32 (2011)**, with the IBM Institute for Business Value — [project page](https://sloanreview.mit.edu/projects/analytics-the-new-path-to-value/) |
| **A2** | Fewer than three in ten employees use analytics and BI tools, roughly flat for seven years | **Reported — vendor survey** | Said as such |
| **A3** | A general lessons-learned repository was built (paper 1992, online 1994); its own auditors found in 2012 that **contribution and use were inconsistent** | **Reported** | NASA OIG, [IG-12-012 (2012)](https://oig.nasa.gov/docs/IG-12-012.pdf) |

---

## The standards and the method

| # | Claim | Status | Source |
|---|---|---|---|
| **S1** | A general provenance standard — entities, activities and the people behind a piece of data — has been a **W3C Recommendation since 30 April 2013** | **Verified** | [PROV-DM](https://www.w3.org/TR/2013/REC-prov-dm-20130430/). ⚠️ What is missing is its *use at decision level*, not its existence |
| **S2** | Conformed dimensions and drilling across: report two fact tables on shared rows without merging them | **Verified** | [Kimball Group](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/) |
| **S3** | Object-centric event logs exist specifically to stop flattening everything to one case notion | **Verified** | OCEL 2.0, [arXiv:2403.01975](https://arxiv.org/abs/2403.01975) · [ocel-standard.org](https://www.ocel-standard.org/) |
| **S4** | Decision mining from event logs has existed since 2006, and required the deciding attributes to already exist as columns | **Verified** | Rozinat & van der Aalst, [doi:10.1007/11841760_33](https://doi.org/10.1007/11841760_33) |
| **S5** | "Decision provenance" has been named in the accountable-systems literature since 2019 | **Verified** | Singh, Cobbe & Norval, *IEEE Access* 7:6562–6574, [arXiv:1804.05741](https://arxiv.org/abs/1804.05741) |
| **S6** | Retrieval grounds an answer in your own material; published 2020 | **Verified** | Lewis et al., NeurIPS, [arXiv:2005.11401](https://arxiv.org/abs/2005.11401) |
| **S7** | ⭐ The EU register offers **16 violation categories and 70 keyword specifications**, and still carries **two "other" routes**: an "other violation of terms" category and an "other" keyword with a 500-character free-text field | **Verified** | Its own API documentation and live filters |
| **S8** | It records **detection and decision as separate fields**: `automated_detection` (yes/no) and `automated_decision` (fully / partially / not automated) | **Verified** | Same |

---

## How decisions actually get made

| # | Claim | Status | Source |
|---|---|---|---|
| **H1** | A 1972 model describes choices, problems, solutions and people as four streams meeting by timing rather than by deliberation. **Cited 7,427 times — about 130 a year, every year since** | **Verified — counted** | Cohen, March & Olsen, *Administrative Science Quarterly* 17:1–25 (1972), [jstor.org/stable/2392088](https://www.jstor.org/stable/2392088). Citation count from Semantic Scholar, 10 October 2026 |
| ⚠️ **H2** | That model's follow-up work is **mostly simulation**, with fewer lab and field tests | **Verified as a limitation** | ⛔ **Do not read the citation count as a replication count** |
| **H3** | ⭐ Research on expert judgement finds experienced people recognise and act, then shift into deliberate reasoning **when a decision must be justified** — observed across fire services, ambulance, policing and the military | **Reported — a converging picture** | Naturalistic decision-making and intuition literature. ⚠️ Largely qualitative and domain-specific |
| **H4** | When a reported number meets its target, an observer cannot distinguish real improvement from improvement bought elsewhere, from hitting the number while missing its purpose, or from misreporting | **Verified** | Bevan & Hood, *Public Administration* 84(3):517–538 (2006), [doi:10.1111/j.1467-9299.2006.00600.x](https://doi.org/10.1111/j.1467-9299.2006.00600.x) — cited more than 1,300 times. ⚠️ Do **not** say targets "always" create gaming; the paper does not |
| **H5** | People supervising a usually-right system stop checking it — automation bias | **Verified** | Parasuraman & Manzey, *Human Factors* 52(3):381–410 (2010), [doi:10.1177/0018720810376055](https://doi.org/10.1177/0018720810376055) |

---

## The money

| # | Claim | Status | Source |
|---|---|---|---|
| **M1** | Worldwide generative AI spending, 2025 forecast: **US$643.86bn — devices $398.3bn, servers $180.6bn, software $37.2bn, services $27.8bn.** Nine dollars in ten bought hardware | **Verified — the analyst's own published table** | Gartner press release, 31 March 2025. ⚠️ A forecast, not a measurement |
| **M2** | BI and analytics software spending in 2025 is **about US$40bn**, up from about $10.5bn in 2010 | **Reported — a range, $34bn–$47bn across three analysts** | ⛔ **BI spending did not fall. It grew and was dwarfed.** ⚠️ Estimates disagree by 2–3× for the same year, which is why no long-run trend line is used anywhere |

---

## ⛔ Withdrawn

**Claims removed from this material after challenge. They are listed so they do not come back.**

| Withdrawn | Why | What to say instead |
|---|---|---|
| "The link from a decision back to the evidence was never built" | **False.** P1–P6 | "It has been built, five times, across five industries" |
| "There is no standard for this" | **False.** S1 — W3C PROV since 2013 | "A general standard has existed since 2013; what is missing is its use at decision level" |
| "There is no evidence that recording decisions improves them" | **False.** E1 — 177 studies | "The reason half has 177 trials behind it; the basis half is the open question" |
| "80,000 experiments at Capital One" | **Not traceable** to any annual report or filing | Quote the annual report wording only |
| "Targets always create gaming" | **Overstates** Bevan & Hood | Use the four-way indistinguishability finding |
| "Nobody records why a decision was made" | **False.** P1, P5 | "In the lineage tools I use, what is recorded is what was connected, not why" |
