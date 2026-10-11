# Contributing

**The most useful thing you can do here is disagree with something specific.**

## Four things worth contributing

| | How |
|---|---|
| ⭐ **A reason-code list from your domain** | One file in [`reason-codes/`](reason-codes/), same shape as the others. **This is the highest-value contribution** — the proposal is only worth as much as the lists people actually use |
| **An eighth dimension** | Open an issue saying what the conformed seven cannot express in your work |
| **A sixth precedent** | If your organisation already records decisions with reasons and outcomes, that extends the evidence rather than contradicting it. Please add it |
| ⭐ **Evidence on the basis column** | If you know of a controlled comparison of decision quality with and without a basis record, that is the open question and the best thing anyone could bring |
| ⭐ **A query that actually ran** | The SQL in [`example/`](example/) and [`ddl/`](ddl/) was written without a database to run it against, and says so. **Run it, and send the corrections with the engine you used** |

## Before you open a pull request

**Three commands, and all three must pass.** Perl and `JSON::PP` are all they need, and `JSON::PP` ships with Perl.

```bash
cd spec
perl build-vocab.pl --check            # the vocabulary CSVs still match their source
perl check-spec.pl                     # schema, vocabularies and worked example agree
perl check-profile.pl ../example/decisions.json
```

**A vocabulary change is made in one place only:** the table at the top of [`spec/build-vocab.pl`](spec/build-vocab.pl). Run `perl build-vocab.pl` and it rewrites all eight CSVs from that table. ⭐ **Editing a CSV by hand is the one thing `--check` exists to catch**, and [CI runs it on every pull request](.github/workflows/check.yml).

**Values are added and retired, never redefined** — [VERSIONING.md](spec/VERSIONING.md) says what each kind of change costs.

## What a useful disagreement looks like

**Specific beats general.** "Seven is wrong" is hard to act on. "Seven cannot express *who the decision was escalated from*, and here is why that matters in clinical triage" is a change someone can make.

**Counter-examples are welcome and do not need softening.** Every claim here is scoped to what was actually checked. If you can name a sixth organisation that built this, or a trial I missed, that makes the material better and it will be credited.

## Claims and evidence

Every factual claim is in [CLAIMS.md](CLAIMS.md) with a source and a status: **Verified**, **Reported**, **Derived**, or **Assumption**. If you find one that is wrong, mis-sourced, or stated more strongly than its source supports, **open an issue and it will be corrected or withdrawn.**

Three claims have already been withdrawn from this material after exactly that kind of challenge. The register records them.

## Licence

Contributions are accepted under [CC0](LICENSE) — the same public-domain dedication as the rest. **A shared vocabulary that someone owns is not a shared vocabulary.**
