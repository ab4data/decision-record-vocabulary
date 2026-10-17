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
| ⭐ **P8** | ⭐ **Architecture decision records are kept in at least 921 public code repositories.** Adoption is described as low and rising each year, and about **half of those repositories hold only one to five records** | **Verified — counted, with the dataset published** | Buchgeher, Schöberl, Geist, Dorninger, Haindl & Weinreich, *Using Architecture Decision Records in Open Source Projects — An MSR Study on GitHub*, **IEEE Access (2023)**, [doi:10.1109/ACCESS.2023.3287654](https://doi.org/10.1109/ACCESS.2023.3287654) · dataset: [921 crawled repositories](https://github.com/software-competence-center-hagenberg/ADR-Study-Dataset). ⚠️ **Public repositories, not organisations** |

---

## The evidence on whether it helps

| # | Claim | Status | Source |
|---|---|---|---|
| **E1** | ⭐⭐ Showing people their own decisions back improves what they do next: **median gain 2.7%, mean 6.2%**, moderate certainty, pooled across **177 studies** | **Verified — re-read at source 13 October 2026** | Cochrane, Ivers et al., *Audit and feedback: effects on professional practice*, [CD000259.pub5, 22 June 2026](https://doi.org/10.1002/14651858.CD000259.pub5). Median 2.7% (IQR **0.0–8.6**); mean 6.2% (95% CI 4.1–8.2); OR 1.47 (95% CI 1.31–1.64). 558 dichotomous outcomes across 177 studies. ⚠️ **2.7% is the median, not a floor — the lower quartile is 0.0%, so a quarter of outcomes showed no improvement.** ⛔ Do not cite pub4, and do not mix in the 2012 pub3 figure of 4.3% |
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
| ⭐⭐ **A4** | ⛔ **A mandatory field buys a value in every row, not a true one.** Cause-of-death coding is a century old, mandatory worldwide and staffed by trained coders, and **29% of 1,000,128 Norwegian deaths 1996–2019 went to a residual code**, with major residual codes **rising** across the 24 years. Worldwide the share runs **4% to more than 80%** | **Verified — read at source** | Ellingsen, Alfsen, Ebbing, Pedersen, Sulo, Vollset & Braut, **BMC Public Health 22:1301 (2022)**, [doi:10.1186/s12889-022-13693-w](https://doi.org/10.1186/s12889-022-13693-w) |
| ⭐ **A5** | ⭐ **A decision record is who, when and what kind — the shape that re-identifies.** Four time-and-place points uniquely identify **95%** of individuals in a 1.5-million-person study; two identify more than half | **Verified** | de Montjoye, Hidalgo, Verleysen & Blondel, *Unique in the Crowd*, **Scientific Reports 3:1376 (2013)**, [doi:10.1038/srep01376](https://doi.org/10.1038/srep01376). ⚠️ **Mobility traces, not decision records** — the parallel is the data shape, and it must be stated that way |
| ⭐ **A6** | ⭐ **A mandate is not the mechanism — a gate is.** The record sticks where it is the price of something the writer already wanted: departing from a protocol (P1), publishing (P4), operating in Europe (P6), or knowing what to offer next (P3). **The one precedent attached to no gate is the software one**, and it is the one with low adoption and half its repositories holding one to five records (P8) | ⭐ **An argued reading of P1–P8, offered as one** | The pattern is visible across the registered precedents; the causal claim is mine. **Open to a counter-example** |

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
| **M2** | BI and analytics software spending in 2025 is **about US$40bn**, up from about $10.5bn in 2010 | **Reported — a range, $34bn–$47bn across three analysts** | ⛔ **BI spending did not fall. It grew and was dwarfed.** ⚠️ Estimates disagree by 2–3× for the same year, **so only cited points are ever plotted and nothing between them is interpolated** |
| ⭐ **M3** | ⛔ **No defensible year-by-year series exists for BI and analytics software spending** | ⭐ **A bounded search result, re-checked 11 October 2026** | For **2019 alone**, three houses published **$24.8bn** (Gartner market share), **$22bn** (Forrester) and **$14.9bn** (Statista). Gartner's own 2017 forecast put 2020 at **$22.8bn** while its market-share report already had 2019 at **$24.8bn** — forecast and market-share bases differ. **If you know of a consistently-scoped public series, [that is a correction worth having](../../issues)** |


## Agentic AI: what is being bought, and how it is going

| # | Claim | Status | Source |
|---|---|---|---|
| **G1** | In a January 2025 poll of **3,412 webinar attendees**, **19%** said their organisation had made significant investments in agentic AI | **Reported — analyst-published** | Gartner. ⚠️ A webinar-attendee poll, which self-selects for interest; not a population survey |
| ⭐ **G2** | **More than 40% of agentic AI projects are forecast to be cancelled by the end of 2027**, for escalating costs, unclear business value or inadequate risk controls | **Reported — analyst-published forecast** | Gartner press release, 25 June 2025. ⚠️ A forecast, not a measurement |
| **G3** | Of thousands of vendors claiming agentic capability, an analyst estimates only about **130** are genuinely agentic; the rest is "agent washing" | **Reported — analyst-published** | Gartner, 25 June 2025 |
| ⭐ **G4** | **About 95% of enterprise generative-AI pilots showed no measurable effect on profit and loss** | **Reported — single study** | MIT NANDA, *The GenAI Divide: State of AI in Business 2025*, August 2025 — 150 leader interviews, 350 employees surveyed, 300 public deployments. ⚠️ "Failure" here means no measurable P&L impact, not abandonment. A modest sample and a single study |
| ⭐⭐ **G5** | ⛔ **Withdrawn: "most organisations are trying to buy the third capability directly."** It sat in bold on `threecaps` in both decks with no register entry. **G1, G2 and G4 are what the evidence actually supports**, and they are narrower | **Withdrawn — never reinstate** | Replaced on the slide by the labelling condition: where the outcome labels itself, delegation already runs; where it does not, the record is the label |

---

## How unaided human judgement performs

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **N1** | In noise audits at an insurance company, the **median difference in premiums set by different underwriters for identical policies was 55%**, and the **median difference in payouts by different claims adjusters for identical claims was 43%** | **Reported — the authors' own consulting audits, published in a trade book** | Kahneman, Sibony & Sunstein, *Noise: A Flaw in Human Judgment* (2021). ⚠️ **Widely cited but not peer-reviewed.** Said as the authors' own audit, every time |
| ⭐ **N2** | Asked how much variation they expected among expert judgments, **828 senior executives gave a median answer of 10%** — roughly a fifth of what the audits found | **Reported — same source** | *Noise* (2021). ⚠️ Not peer-reviewed. ⭐ The gap between expectation and measurement is the usable part |
| ⭐⭐ **N3** | Across a large body of comparisons, **mechanical prediction was about 10% more accurate than clinical judgement on average**, and clinicians were substantially more accurate in only **6–16% of studies** — consistent regardless of task, judge type, experience or data type | **Verified — peer-reviewed meta-analysis** | Grove, Zald, Lebow, Snitz & Nelson, *Psychological Assessment* 12:19–30 (2000). ⚠️ **The widely-quoted "136 studies" belongs to Grove & Meehl (1996), not this paper** — do not conflate them |
| ⭐ **N4** | **Decision fatigue within a single session is measurable.** Clinicians were **about 26% more likely to prescribe an antibiotic in the fourth hour of a session than in the first**, for acute respiratory infection, across 23 primary-care practices over 17 months | **Verified — peer-reviewed, observational** | Linder et al., "Time of Day and the Decision to Prescribe Antibiotics", *JAMA Internal Medicine* 174(12):2029–31 (2014). ⚠️ Observational; the authors attribute it to decision fatigue but did not test the mechanism |
| ⭐⭐ **N5** | **A decision record is a continuous noise audit.** The audits behind N1 had to construct identical cases and route them to many experts. The same `task_type` decided by different workers, with a reason on each row, measures the same variation continuously and at no extra cost | **Assumption — an argued reading of N1 and the schema, offered as one** | The mechanism follows from the record's own grain; no trial of it exists. **Open to a counter-example** |
| ⛔ **N6** | ⛔ **Do not use the parole-hearing / "hungry judges" study.** It is widely quoted and is contested on the grounds that case ordering was not random | **Quarantined — never cite** | Danziger et al. (2011) and the Weinshall-Margel & Shapard critique |
| ⛔ **N7** | ⛔ **Do not use "people make 35,000 decisions a day."** The figure circulates without a traceable source | **Quarantined — never cite** | Untraceable. **N4 is the defensible way to make the fatigue point** |
| **N8** | Whether colonoscopy adenoma-detection rates fall later in the day is **contested** — some studies find a decline of roughly 7%, others find none, and one set of authors attributes the decline to rushing rather than fatigue | **Contested — excluded from the deck** | Multiple studies, 2015–2018. ⚠️ Mixed evidence; not used |

---

## How fast feedback works, and how long it lasts

Full research record, with the design and limits of each source: `Build Documentation/13_Feedback_Time_Course_Research.md`.

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **F1** | The Cochrane review's full figures: **292 studies, 678 study arms**; across **558 dichotomous practice outcomes from 177 studies** the **median absolute improvement was 2.7%, interquartile range 0.0 to 8.6**; the meta-analysis found a **mean absolute increase of 6.2%, 95% CI 4.1 to 8.2**, and an **odds ratio of 1.47, 95% CI 1.31 to 1.64** | **Verified — re-checked at Cochrane, 17 October 2026** | Ivers et al., CD000259.pub5, published **22 June 2026**, Issue 6. Moderate certainty for the mean increase and the odds ratio. ⚠️ **The review's evidence base runs to June 2020** |
| ⭐ **F2** | **Lower baseline performance was associated with larger intervention effects** | **Verified — same review** | CD000259.pub5. ⭐ This is why the median is a floor rather than a forecast: nobody deploys feedback where performance is already good |
| ⚠️⭐⭐ **F3** | **Repeated delivery of feedback was associated with a *lower* effect size** — which the review's authors describe as **contrary to expectations** | **Verified — same review** | CD000259.pub5. ⭐ Frequency is not the lever. **This rules out claiming that feedback compounds, and no slide may draw a compounding curve** |
| ⭐⭐ **F4** | **A measured trajectory**: in an inpatient acquired brain injury rehabilitation unit, **fortnightly** audit and feedback cycles run for **14 months** against **114 clinical indicators** raised median adherence from **38.8%** (95% CI 34.3–44.4) to **83.6%** (95% CI 81.8–88.5) | **Reported — uncontrolled before-and-after, single unit** | Jolliffe et al., *PLoS ONE* (2019), PMC6415863. ⚠️ **Read it for the shape, not the size.** The improvement cannot be attributed to the feedback alone |
| ⭐ **F5** | **The gain partly decayed once the cycles stopped**: three months after the programme ended, median adherence had fallen **from 82.3% to 76.6%** | **Reported — same study, same design limits** | Jolliffe et al. (2019). ⭐ The only follow-up-after-withdrawal figure found |
| ⭐⭐ **F6** | **A decision made about a rule, threshold or policy is applied to every case that matches it**, by every worker who handles one, human or agent, until it is changed — so showing a policy owner what their rule did has leverage proportional to that fan-out | **Assumption — arithmetic, and true by definition of a rule. No trial of it exists** | Mine. Anchored on documented fan-out: **P6**, 375 platforms filing a record for every content decision, and **D5**, a single credit policy governing every application. **Open to a counter-example** |

---
## What can be delegated, and to what

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **W1** | **Six tests sort a decision onto one of four rungs**: does the outcome label itself · how soon do you know · does it recur · can "right" be written before the attempt · what does wrong cost and can it be undone · is the input bounded. The rungs are the four values of `worker_kind` | **Assumption — an argued framework, offered to be attacked** | Mine. The rungs carry evidence individually (N3, the classification finding, D1, D5); the sort itself does not |
| ⭐ **W2** | **Sectors sort the same way.** Where ground truth arrives automatically — card authorisation, content moderation, spam, ad bidding, ranking, test gates — delegation is long since done. Where it does not — underwriting, clinical variance, credit exceptions, approvals, casework, audit — it has not started | **Assumption — one test applied by hand, offered to be argued with** | Anchored on documented cases: D1 (card authorisation), P6 (375 platforms on the European register), N1 (insurance underwriting), P1 (hospital protocol since 1988), D5 (credit adverse action). **The remaining entries are the same test applied** |

---
## Where delegation already works without a decision record

| # | Claim | Status | Source |
|---|---|---|---|
| **D1** | A card network's risk platform scores a transaction in **under 300 milliseconds** from tap to issuing bank; the network reports roughly **160 billion transactions a year** and peaks near **70,000 per second** | **Reported — vendor-published** | Mastercard, *AI-powered decision management*, b2b.mastercard.com. ⚠️ Said aloud as vendor-published. ⚠️ The platform is named "Decision Intelligence Pro", which collides with this talk's subject |
| **D2** | A second card network reports assessing **more than 500 risk attributes in about a millisecond** per transaction | **Reported — vendor-published** | Visa AI and machine learning guide. ⚠️ Vendor-published |
| ⭐ **D3** | A payments firm said in February 2024 its AI assistant was doing the work of **700 full-time agents**, handling about **2.3 million conversations in its first month** across 35+ languages; it later moved back toward human support, its chief executive saying cost had weighed too heavily and quality suffered | **Reported — company statement, then press** | Klarna, February 2024; reversal reported 2025. ⚠️ Dates for the reversal differ between secondary outlets; the Bloomberg interview is the primary source to check |
| ⭐⭐ **D4** | **These work because the outcome labels itself.** A chargeback, a failing test, an unreported email: ground truth arrives automatically, so no written reason is needed. Where no label arrives on its own, the reason has to be recorded | **Assumption — an argued reading of D1–D3, offered as one** | The pattern is visible across the three; the causal claim is mine. **Open to a counter-example** |
| ⭐ **D5** | **United States consumer credit requires a statement of the specific principal reasons for a denial**, and in September 2023 the regulator stated that creditors using complex or AI models may not rely on generic sample-form reasons, nor excuse non-compliance by pointing to model complexity | **Reported — read from law-firm analysis, not the Circular** | Regulation B / ECOA; CFPB Circular 2023-03, 19 September 2023. ⚠️ ⭐ **Verify against the CFPB's own text before the talk** |
| **D6** | Published accounts of successful agent deployments describe writing evaluation criteria before the run and scoring each attempt against them — an "outcomes loop" | **Reported — vendor and practitioner sources** | Summaries of Anthropic and other deployment guidance, 2026. ⚠️ Much 2026 agent-deployment material is vendor-published or self-published; two widely-cited figures could not be verified at source and are excluded |

---
---

## ⛔ Withdrawn

**Claims removed from this material after challenge. They are listed so they do not come back.**

| Withdrawn | Why | What to say instead |
|---|---|---|
| "The link from a decision back to the evidence was never built" | **False.** P1–P8 | ⭐ **"It has been built many times. P1–P7 are five documented examples spanning four decades, and two of them are hundreds of implementations on their own — 375 platforms in the European register, and 921 public repositories keeping architecture decision records."** ⛔ **Never say "five times": that is a count of the examples chosen here, not a count of the implementations that exist** |
| "There is no standard for this" | **False.** S1 — W3C PROV since 2013 | "A general standard has existed since 2013; what is missing is its use at decision level" |
| "There is no evidence that recording decisions improves them" | **False.** E1 — 177 studies | "The reason half has 177 trials behind it; the basis half is the open question" |
| "80,000 experiments at Capital One" | **Not traceable** to any annual report or filing | Quote the annual report wording only |
| "Targets always create gaming" | **Overstates** Bevan & Hood | Use the four-way indistinguishability finding |
| "Nobody records why a decision was made" | **False.** P1, P5 | "In the lineage tools I use, what is recorded is what was connected, not why" |
