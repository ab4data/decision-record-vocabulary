# Conformance profiles

**Three levels, so that a team can claim something true on the first day.**

Most schemas ask you to arrive fully equipped. This one names a level you can reach in an afternoon, and two you can grow into. ⭐ **Each level is a complete, honest claim** — Core is not a draft of Standard, it is a working thing in its own right.

| | Level | Columns | What it buys |
|---|---|---|---|
| 1 | ⭐ **Core** | 5 | **Count outcomes and reasons, and compare with any other Core domain.** An afternoon of work |
| 2 | **Standard** | 11 | Compare *kinds of work* and *kinds of worker*, count repeat attempts, and measure how long decisions take |
| 3 | **Full** | 16 | Trace what each decision rested on, and prove the standard was set before the work |

**State the level you meet.** [`check-profile.pl`](check-profile.pl) reads an extract and tells you which one it reaches.

---

## 1 · Core — five columns

```
decision_id   task_type   decided_at   outcome   reason_class
```

| Column | |
|---|---|
| `decision_id` | Unique within your system |
| `task_type` | What kind of work this was, from a list you write |
| `decided_at` | When the judgement was made |
| `outcome` | `accepted` · `edited` · `rejected` · `abandoned` |
| ⭐ `reason_class` | **One of eleven shared classes.** This is the column that travels |

⭐ **Core is already enough to drill across.** Two Core domains that agree on `reason_class` appear on the same chart, and [`example/`](../example/) does exactly that. **Everything above Core sharpens the picture. Core is what makes the picture exist at all.**

**The rule that makes Core worth having:** the standard a row is judged against is written *before* the work starts. Record the judgement that was made against that standard, and `outcome` means something.

---

## 2 · Standard — eleven columns

Core, plus six:

| Column | What it adds |
|---|---|
| `task_id` · `attempt` | **A task attempted three times is three rows.** These two say which attempt you are looking at |
| `decided_by` | Who or what made the call. Pseudonymous — report on kinds of work, never on named people |
| ⭐ `worker_kind` | `person` · `agent` · `deterministic_code` · **`person_with_agent`** |
| `reason_code` | Your own words, from your own short list. **Stays local, always** |
| `decide_seconds` | How long it took |

⭐ **`worker_kind` is the one to reach for first.** It answers whether work decided with model assistance is accepted at the same rate as work decided without it — **a question arriving in most organisations within the year**, and one that only data collected beforehand can answer.

---

## 3 · Full — sixteen columns

Standard, plus five:

| Column | What it adds |
|---|---|
| ⭐ `basis_refs` | **The identifiers of what was actually in front of the decider.** See [relations.md](relations.md) |
| `standard_set_at` | When the standard was written. ⭐ **This makes "before the work started" checkable rather than promised** |
| `data_class` | How sensitive the material was, from your own classification scheme |
| `detected_automatically` · `decision_automation` | Two fields, deliberately. *A machine found it and a person judged it* is a different thing from *a machine did both* |

**Full is where the record starts answering questions nobody put to it.** `basis_refs` turns a pile of decisions into a graph: change a policy, and you can list every decision that applied the version before it.

---

## Recommended at every level

**These three are never required, and each is worth capturing where your systems already hold it.**

| Column | What it buys |
|---|---|
| ⭐ `proposed_outcome` | What software proposed, where a person then decided. **With `worker_kind = person_with_agent`, the override rate becomes a number you can read off** — the worked example reports it |
| `model_id` | Which model answered, where routing picks one. A dimension today, a question later |
| `reason_text` | One free-text sentence. **Required where `reason_class` is `other`**, useful anywhere |

---

## Rules that hold at every level

1. ⭐ **`reason_class = conformed` is a value, not an absence.** A row where the standard applied and was followed is recorded like any other. **Those rows are the denominator; without them every rate is unreadable.**
2. **`reason_class = other` carries `reason_text`.** The rate of `other` is worth watching, and it can only be investigated if the text is there.
3. **`proposed_outcome` appears only with `worker_kind = person_with_agent`.** It records what *something else* proposed, so against any other worker kind it would make the override rate wrong.
4. **`standard_set_at` is never later than `decided_at`.** JSON Schema cannot compare two fields, so both checkers enforce this instead.
5. **`reason_code` is never conformed.** It is yours, in your language. The class is what travels.
6. ⭐ **Extra columns are expected and welcome.** The schema sets `additionalProperties: true` on purpose. **Conformance means the named columns mean the same thing — never that you have only these.**

---

## Checking an extract

```bash
cd spec && perl check-profile.pl ../example/decisions.json
```

```
  Core      MET    5 of  5 columns on every record
  Standard  MET   11 of 11 columns on every record
  Full      MET   16 of 16 columns on every record

  This extract meets the Full profile.
```

**Point it at your own extract** — a JSON array, or one JSON record per line — and it names the level you have reached, lists the columns standing between you and the next one, and flags any value outside the published vocabulary. It needs only Perl and `JSON::PP`, both of which ship with Perl itself.

**To test the repository rather than your data**, [`check-spec.pl`](check-spec.pl) verifies that the schema, the vocabulary CSVs and the worked example all still agree.
