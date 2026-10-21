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

## Why this wave is stalling — 2026

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **G6** | **The most-pursued AI use cases are not the ones reporting a return.** Most pursued, in order: cybersecurity threat detection, IT service desk automation, automated code generation. Reporting a positive return, in order: IT asset and cost optimisation, synthetic data generation, automated code generation. **One entry appears on both lists** | **Reported — analyst-published. ⛔ RANKING ONLY; the published percentages must not be shown** | Gartner press release, **1 September 2026**; survey fielded **January to April 2026**, **1,303 respondents** at organisations with at least US$50m FY2025 revenue. ⛔ **The two percentage sets sit on different bases** — one is the share of C-suite respondents pursuing a use case, the other a share within a reporting base the release does not state — **and the release never defines the minimum threshold for a positive return.** They are not comparable with each other, so the deck shows the ranking and withholds the numbers |
| ⭐ **G7** | **Only 22% of organisations have successfully scaled AI across multiple business units** or adopted an AI-first approach | **Reported — analyst-published** | Same survey and release |
| ⭐⭐ **G8** | **The analyst's own explanation for the gap**: leaders are choosing **from what they have seen in publications, keynotes and vendor messaging rather than from a business case.** Organisations getting returns pick narrowly and build foundations first, and **data quality is named as the common gap** | **Reported — the analyst's own stated reasoning** | Same release, as reported by ITPro, 3 September 2026. ⭐ This is the analyst's wording, not the speaker's |
| ⭐ **G9** | **Choosing from a business case requires knowing what your own decisions cost and how often they go wrong** — which is the two columns, not an AI capability | **Assumption — the speaker's reading of G6–G8, labelled on the slide** | Mine. **Open to a counter-example** |
| ⛔ **G10** | ⛔ **Do not cite "782 leaders" or "57% said they expected too much too fast."** Circulated by secondary aggregators and **not found in Gartner's own newsroom** | **Quarantined — unverified at source** | Searched 17 October 2026; no matching Gartner release located. **G6–G8 are the verifiable 2026 figures** |

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
## Why the two columns differ

Full research record: `Build Documentation/15_Why_The_Two_Columns_Differ_Research.md`.

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **C1** | **Feedback with definable goals and metrics, tolerance for error, and no need for explanation are published criteria for whether a task suits machine learning** — three of the properties that separate the two columns in this talk | **Verified — peer-reviewed policy forum** | Brynjolfsson & Mitchell, *Science* 358(6370):1530–1534 (2017), DOI 10.1126/science.aap8062. ⭐ **The talk's own test is one of theirs, arrived at independently.** ⚠️ Sources disagree on the number of criteria (21 vs 8); **the rubric is in the supplementary materials and must be read there before any count is spoken** |
| ⭐ **C2** | **Tasks most amenable to computerisation are those following explicit, codifiable procedures.** Where the knowledge is tacit — *we know more than we can tell* — it resists being written as a procedure | **Verified — published, widely cited** | Autor, *Polanyi's Paradox and the Shape of Employment Growth* (2015) |
| ⭐⭐ **C3** | **People lose confidence in an algorithmic forecaster faster than in a human after seeing it make the same mistake**, and avoid it even having seen it outperform the human | **Verified — peer-reviewed, five studies** | Dietvorst, Simmons & Massey, *Journal of Experimental Psychology: General* 144(1):114–126 (2015). ⭐ **This explains the asymmetry rather than describing it**: in the left-hand column no individual ever sees one decision, so the aversion never forms |
| ⭐⭐ **C4** | ⛔ **Suitability for machine learning varies more WITHIN an occupation than between occupations.** Most occupations contain at least some suitable tasks and few are fully automatable | **Verified — peer-reviewed** | Brynjolfsson, Mitchell & Rock, *AEA Papers and Proceedings* (2018) — rubric applied to 2,069 work activities, 18,156 tasks and 964 occupations in O*NET. ⚠️ A related version cites 18,112 tasks and 950 occupations; **check the published PDF before quoting a count** |
| ⛔⭐⭐ **C5** | ⛔ **WITHDRAWN: "the right-hand column is almost exactly the list of jobs that need a qualification."** Never reinstate | **Withdrawn 17 October 2026** | Three reasons: **C4** shows occupation is the wrong unit of analysis; the left-hand column is **built and operated by** qualified professionals (quantitative finance, ML engineering, network engineering); and qualification is awarded for liability, safety and entry restriction as well as for non-codifiable judgement. **Replaced by:** in the left column a qualified person builds the system and the system decides each case; in the right, a qualified person decides each case |
| ⛔ **C6** | ⛔ **Complexity does not separate the columns, and the deck must not imply it does.** Real-time fraud scoring at 160 billion transactions a year is not a simple problem | **Stated limitation** | The separating properties are C1–C3, all of which concern the **information environment** of the decision rather than its difficulty |
| ⭐⭐ **C7** | **A decision record is a partial escape from Polanyi's paradox**: judgement that cannot be written as a procedure can still be written as instances, and enough judged attempts describe the judgement | **Assumption — an argued reading of C2 and the schema, offered as one** | Mine. Connects to **R4**: per-case expert decisions are what adaptive routing needs. **Open to a counter-example** |

---
## Adaptive routing: what already exists, and what this proposal does not claim

Full research record: `Build Documentation/14_Adaptive_Decision_Routing_Research.md`.

| # | Claim | Status | Source |
|---|---|---|---|
| **R1** | **Model cascades route per request**: call pretrained models cheapest-first, judge each answer with a learned scorer, and stop when one is acceptable. Reported to match GPT-4 at **up to 98% cost reduction**, or exceed its accuracy by **4%** at equal cost | **Reported — the authors' own experiments** | Chen, Zaharia & Zou, *FrugalGPT*, arXiv 2305.05176 (2023). ⚠️ **Per-dataset savings were 98.3%, 73.3% and 59.2% — the headline is the best of three, not an average.** No independent replication found |
| **R2** | **Learning to defer trains a classifier and a rejector jointly**, from samples of an expert's decisions, so the system learns which individual cases to hand to a person | **Verified — peer-reviewed** | Mozannar & Sontag, arXiv 2006.01862 (2020); Charusaie et al., ICML 2022 |
| ⭐ **R3** | Finding an optimal linear classifier-and-rejector pair is **NP-hard even when a zero-error pair exists**, and earlier methods can miss it | **Verified — peer-reviewed** | Mozannar et al., "Who Should Predict?" (2023) |
| ⭐⭐ **R4** | **Learning which instances to defer requires a large number of expert predictions**, in addition to the ground-truth labels needed to train the model | **Verified — peer-reviewed** | Hemmer et al., AAAI 2023, "Learning to Defer with Limited Expert Predictions". ⭐ **This is the dependency the decision record satisfies** |
| ⛔⭐⭐ **R5** | ⛔ **This proposal is NOT superior to existing routing research, and must never claim to be.** The `delegable` ladder is a coarse, static, class-level assignment; cascades and learning-to-defer route **per individual case** and are strictly more powerful | **Stated limitation — carried on the slide in both decks** | The honest position: **the routing is theirs; the training data is the gap.** A decision record produces per-case expert decisions (R4) as a by-product of work, and the conformed `reason_class` layer — comparing across organisations — is the part absent from this literature |

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

## Typed decision models, and the Decisions API — October 2026

Full research record: `Slides/26_Decision_Intelligence/research.md`. ⚠️ **This category is five weeks old and moving. Every row here is re-checked in pre-flight.**

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐⭐ **T1** | **OpenAI's Decisions API takes a caller-defined option set and returns one of those options with a confidence.** The endpoint is `POST /v1/decisions`, the model is `gpt-6-luna`, and it offers three question types: **predicate** (probability a condition is true), **choice** (select one of your supplied values), and **score** (rate against ordered levels) | **Verified — vendor documentation** | OpenAI, Decisions API guide, developers.openai.com/api/docs/guides/decisions. ⭐⭐ **The `choice` type is the shape of a reason code** |
| **T2** | Previewed **30 September 2026**, **public beta to all developers 6 October 2026**; the documentation says GA is expected "in the coming weeks" | **Verified — vendor announcement** | OpenAI Developer Community, 6 October 2026. ⚠️ **Perishable. Re-check the status in the week of the talk** |
| **T3** | Input is priced at **$0.10 per 1M tokens**, with no output, cache-read or cache-write charge | **Verified — vendor documentation** | As T1. ⚠️ Long-context and regional multipliers apply |
| ⚠️ **T4** | The API "returns typed answers about 10x faster than the Responses API" | ⚠️ **Reported — vendor-published, no benchmark given** | As T1. ⛔ **Said aloud as the vendor's own figure every time, or left off** |
| **T5** | **TypeSafe AI released Jev on 15 September 2026**, a "System One" decision model returning a choice, a score or a probability instead of prose. Vendor figures: 70–500 ms latency, $0.042 per 1M input tokens | **Reported — vendor-published** | TypeSafe AI, via DigitalOcean and Sanity explainers. ⚠️ Not read at TypeSafe's own site; verify or attribute to the secondary source |
| ⭐ **T6** | **Cloudflare released Clef (27B) and Clef-flash (9B) on 1 October 2026 with weights under Apache 2.0**, 64k context, image input, API-compatible with Jev. AWS Strands Labs released Strands Decider 2B under Apache 2.0 the same day | **Reported — multiple independent outlets, consistent** | AlternativeTo, VKTR, DataNorth, OODA Loop, October 2026. ⚠️ **Cloudflare's own post not read directly.** ⭐ **Open weights mean this layer can run on hardware the organisation owns** |
| ⭐⭐ **T7** | **Type safety guarantees the shape of a decision, not its quality.** Across **1,200 decision tasks**, changing only the mapping between an option's **name** and its **definition** — holding the question, the state and the text fixed — raised decision-flip rates by **up to 70.4 percentage points** against a 0/1 control and moved mean AUC from **93.8% to 23.2%**, below chance. **The type-error rate was 0% throughout** | **Reported — arXiv preprint, not peer-reviewed** | Sun, Xu, Shi & Yang, arXiv 2609.26758, v1 22 September 2026, v3 8 October 2026. ⛔ **Say "preprint" aloud.** ⭐⭐ **No type system detects this; a record read back against outcomes does** |
| ⭐⭐ **T8** | An audit of **28 papers** on typed decision models finds **the typed readout has not shown an independent accuracy advantage** over comparable label-probability readouts, that the clear gains are **latency and cost**, that accuracy gaps remain on harder tasks, and that **confidence is in practice used to decide when to defer to a stronger model or a human**. It proposes a 14-item evaluation checklist | **Reported — arXiv preprint, not peer-reviewed** | Tang & Zheng, arXiv 2609.32160, 26 September 2026. ⭐⭐ **The deference finding is R2 and R4 arriving independently** |
| ⭐⭐ **T9** | **Independently benchmarked.** The Artificial Analysis **Decision Index v1.0**, published **13 October 2026**, scores decision models across knowledge, reasoning, tool calling and classification. Among the **named decision models**, cost runs **$17 to $119 per 1 million tasks** — Decider v1.1 27B $17, Microsoft-Decision-1 $31, Jev 1.13 $42, GLiDE $119 — and median time **0.06 to 0.5 seconds per task** | **Verified — independent benchmarker, read at source** | artificialanalysis.ai/articles/artificial-analysis-decision-index. ⭐ Replaces an earlier secondary-source figure of "$0.11 per 1,000 requests", which is **withdrawn**. ⛔ **An earlier reading of this row gave the range as "$17 to $199", which is withdrawn too: the $199 belongs to no named model, and the index benchmarks language models alongside decision models, so the top of that range is not a decision-model price. It never reached a slide |
| ⭐⭐ **T11** | **A language model scores three points higher and costs 4.4 times as much per task.** On the same index: **Claude Haiku 5.5 (Low) scores 61, at 1.4 seconds and $184 per 1M tasks**; **Jev 1.13 scores 58, at 0.13 seconds and $42 per 1M tasks** — about **11 times faster and 4.4 times cheaper** for three index points. GPT-6 Luna (Low) scores 55 at 1.5 seconds and $131. The lowest cost listed is **$17 per 1M tasks** | **Verified — independent benchmarker, read at source** | As T9. ⛔ **The language model still scores highest — say that, it is the honest half.** ⚠️ Live leaderboard figures move; re-check in pre-flight |
| ⚠️ **T10** | At least nine providers offered a decision model within five weeks of the category appearing: TypeSafe, OpenAI, Cloudflare, AWS Strands Labs, Perplexity, Inception, Upstage, Liquid AI, Together AI | **Reported — aggregated from several outlets** | eesel.ai and GoSearch comparisons, October 2026. ⚠️ **A count of those found, not a census.** Say "at least nine", never "all" |

---
## How much deciding is going on, and what it costs

⚠️ **The two ends of this are measured and the middle is not. That asymmetry is the point, and it is stated on the slide rather than hidden.**

| # | Claim | Status | Source |
|---|---|---|---|
| ⭐ **V1** | In a survey of **more than 1,200 managers** at companies worldwide, **61% said at least half the time spent making decisions is used ineffectively**, and **fewer than half said decisions are timely** | **Reported — consultancy-published** | McKinsey, *Three keys to faster, better decisions*, 2019. ⚠️ Said aloud as consultancy-published. ⚠️ A McKinsey explainer describes the same base as "business leaders" rather than "managers" |
| ⭐⭐ **V2** | The same work puts the waste at about **530,000 manager-days a year for a typical Fortune 500 company**, equivalent to roughly **$250 million in wages annually** | **Reported — consultancy-published, and it is an estimate** | As V1. ⭐ **Both numbers carry a stated base**, which is why they can be used in front of analysts |
| ⭐⭐ **V3** | **Derived, and labelled as derived.** V2 implies about **$472 per manager-day**, so roughly **$1 of manager time a minute** on an eight-hour day. At the **$42 per 1 million tasks** of T11, **one minute of a manager's time buys on the order of twenty thousand scored decisions** | ⚠️ **Derived — arithmetic on V2 and T11, never spoken as a measurement** | $250m ÷ 530,000 days = $472/day; ÷ 8 hours ÷ 60 = $0.98/minute; ÷ $0.000042 per task ≈ 23,000. ⛔ **Say "about twenty thousand" and say that it is arithmetic, not a finding** |
| ⚠️ **V4** | **A search of the published literature did not turn up a per-day count of decisions for any role.** The most-repeated figure, 35,000 a day, concerns **all adults rather than managers**, traces back through a secondary article, and is **already quarantined in this register**. A "70 a day for managers" figure is attributed to an unnamed study that could not be located | **Bounded observation — what was searched, not what exists** | ⛔ **Phrased as a bounded first-person observation on purpose, per §4.** Never say "nobody has counted this". Say: in the sources searched, no per-day count was found. ⭐⭐ **This gap is the argument for capability one, and the talk should say so** |
| **V5** | A card network reports roughly **160 billion transactions a year**, each scored in **under 300 milliseconds** | **Reported — vendor-published** | As D1. Used here as the measured machine end of the range |

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
