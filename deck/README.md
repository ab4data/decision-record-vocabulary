# The talk

Two self-contained HTML files. Open either in a browser; arrow keys, space, Home and End navigate. **No build step, no dependencies, no network calls** beyond a Google Fonts stylesheet.

| File | |
|---|---|
| [`the-second-wave-animated.html`](the-second-wave-animated.html) | **The presented version**, with three animated diagrams · 33 sections |
| [`the-second-wave.html`](the-second-wave.html) | The same content with the animated diagrams removed · 30 sections |

Speaker notes are in `<aside>` elements in the source — hidden on screen, readable in the file. **They carry the caveats**, including which figures are to be said aloud as analyst-published or as a prediction.

`prefers-reduced-motion` is honoured: with it switched on, every diagram renders in its final state instead of moving.

---

## ⚠️ This is the version as it stands today, not a delivered transcript

**The talk is given at the Hunter Data Analytics meetup, Newcastle, on 29 October 2026.** Until then this is a working draft and it changes — **expect the version here to lag the one being rehearsed.**

⭐ **Every factual claim on these slides carries a source and a status in [`../CLAIMS.md`](../CLAIMS.md)**, including the ones that are argument rather than evidence. If a number on a slide and a number in that register ever disagree, **the register is the one that has been checked**, and the disagreement is a bug worth [raising](../../issues).

## What it argues

**Decision Intelligence as three capabilities**, in order, with the third depending on the first two:

| | |
|---|---|
| **Decision memory** | Record why a decision went the way it did, and what it rested on |
| **Organisational learning** | Local words map to a shared class, so two domains can be compared without merging anything |
| **Safe delegation** | Hand out more work, to people and to software, inside a delegation set on evidence |

**The schema it proposes is [`../SCHEMA.md`](../SCHEMA.md), the machine-readable form is [`../spec/`](../spec/), and [`../example/`](../example/) shows it working on 46 records.**
