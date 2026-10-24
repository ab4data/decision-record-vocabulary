-- Starter tables for decision records. SQLite.
--
-- The same shape as postgres.sql, in the dialect most people already have on
-- their machine. SQLite is enough to try this on real data: a year of one
-- team's decisions is a file you can email.
--
-- Not executed in this repository; see ../example/README.md for what was.

PRAGMA foreign_keys = ON;

-- ===========================================================================
-- The conformed dimensions. Load these from ../spec/vocab/*.csv.
-- ===========================================================================

CREATE TABLE dim_locus (
    value       TEXT PRIMARY KEY,
    parent      TEXT NOT NULL,              -- the posture: conformed | departed
    status      TEXT NOT NULL,
    definition  TEXT NOT NULL
);

CREATE TABLE dim_reason_class (
    value       TEXT PRIMARY KEY,
    parent      TEXT REFERENCES dim_locus (value),   -- NULL for conformed and other
    status      TEXT NOT NULL,              -- stable | provisional | deprecated
    definition  TEXT NOT NULL
);

-- ===========================================================================
-- The shared vocabulary, seeded. These are the only two tables every domain
-- holds in common, and they are the same copy everywhere.
--   6 loci, 11 classes, from reason-codes/TAXONOMY.md and CLASSES.md.
-- NOTE conformed and other carry no locus: a locus says where a DEPARTURE
--   came from, and conformed is not one, while other is not yet classified.
-- out_of_scope is seeded as provisional -- 19 of 87 domains, and the most
--   contestable call in the scheme. See reason-codes/CLASSES.md.
-- ===========================================================================

INSERT INTO dim_locus (value, parent, status, definition) VALUES
  ('input',     'departed', 'stable', 'Where the information the decision rested on fell short. Whoever owns intake can act: forms, upstream systems, what gets asked for'),
  ('rule',      'departed', 'stable', 'Where a rule, policy, threshold or boundary decided it. Whoever owns the policy or the rule set can act'),
  ('judgement', 'departed', 'stable', 'Where a person assessed risk, consequence or trajectory. Training, calibration and worked examples are the levers'),
  ('resource',  'departed', 'stable', 'Where money, people, time or a deadline shaped it. Funding, staffing and scheduling are the levers'),
  ('external',  'departed', 'stable', 'Where someone outside the organisation determined it. The lever sits outside, so it is managed rather than fixed'),
  ('authority', 'departed', 'stable', 'Where the decision exceeded the delegation held by the decider. Whoever sets delegations can act');

INSERT INTO dim_reason_class (value, parent, status, definition) VALUES
  ('conformed',             NULL,        'stable',      'The standard, protocol or policy applied and was followed. Every list needs this value'),
  ('evidence_insufficient', 'input',     'stable',      'There was not enough to go on - missing, incomplete, unreadable, unverifiable or not yet available'),
  ('evidence_contradicts',  'input',     'stable',      'What was supplied conflicts with something else that is known'),
  ('rule_conflict',         'rule',      'stable',      'A specific rule, policy, threshold or standard was breached or engaged'),
  ('out_of_scope',          'rule',      'provisional', 'The matter does not fall within the boundary of what is being decided'),
  ('risk_elevated',         'judgement', 'stable',      'An assessment of risk, consequence or trajectory drove the outcome, rather than a rule'),
  ('capacity_or_cost',      'resource',  'stable',      'Resources, budget, volume or cost-to-serve shaped the decision'),
  ('timing',                'resource',  'stable',      'A deadline, window, sequence or statutory clock shaped the outcome'),
  ('third_party',           'external',  'stable',      'The outcome was determined by someone outside the deciding organisation'),
  ('authority_exceeded',    'authority', 'stable',      'Beyond the delegation held by the decider; referred, escalated or stood aside'),
  ('other',                 NULL,        'stable',      'None of the above. Free text required, and the rate is monitored');


-- ===========================================================================
-- One domain's fact table: one row per judged attempt.
-- ===========================================================================

CREATE TABLE claim_assessments (
    -- Core
    decision_id      TEXT PRIMARY KEY,
    task_type        TEXT NOT NULL,
    decided_at       TEXT NOT NULL,         -- ISO 8601, UTC
    outcome          TEXT NOT NULL
                     CHECK (outcome IN ('accepted','edited','rejected','abandoned')),
    reason_class     TEXT NOT NULL REFERENCES dim_reason_class (value),
    class_map_version TEXT NOT NULL,  -- which code->class mapping assigned the class above;
                     -- reason_class is written here, not joined, so history cannot be rewritten.

    -- Standard
    task_id          TEXT NOT NULL,
    attempt          INTEGER NOT NULL DEFAULT 1 CHECK (attempt >= 1),
    decided_by       TEXT NOT NULL,         -- pseudonymous; never a named person
    worker_kind      TEXT NOT NULL
                     CHECK (worker_kind IN ('person','agent','deterministic_code','person_with_agent')),
    reason_code      TEXT NOT NULL,         -- LOCAL. This domain's own words
    decide_seconds   REAL CHECK (decide_seconds >= 0),
    confidence       REAL CHECK (confidence >= 0 AND confidence <= 1),
                     -- OPTIONAL. How sure the decider was, at the time. One scale,
                     -- used consistently. Meaningful only when read back against
                     -- outcome; never trusted on its own.

    -- Full
    standard_set_at  TEXT NOT NULL,
    data_class       TEXT NOT NULL,
    detected_automatically TEXT NOT NULL CHECK (detected_automatically IN ('yes','no')),
    decision_automation    TEXT NOT NULL
                     CHECK (decision_automation IN ('fully','partially','not_automated')),

    -- Recommended
    proposed_outcome TEXT CHECK (proposed_outcome IN ('accepted','edited','rejected','abandoned')),
    model_id         TEXT,
    reason_text      TEXT CHECK (reason_text IS NULL OR length(reason_text) <= 500),

    -- The rules the schema states
    CHECK (standard_set_at <= decided_at),
    CHECK (reason_class <> 'other' OR reason_text IS NOT NULL),
    CHECK (proposed_outcome IS NULL OR worker_kind = 'person_with_agent'),

    UNIQUE (task_id, attempt)
);

CREATE INDEX claim_assessments_class_idx ON claim_assessments (reason_class);
CREATE INDEX claim_assessments_when_idx  ON claim_assessments (decided_at);

-- A second domain is the same shape under its own name, with its own
-- task_type values and its own reason_code list.


-- ===========================================================================
-- basis_refs: one row per edge.
-- ===========================================================================

CREATE TABLE decision_basis (
    decision_id  TEXT NOT NULL,
    basis_type   TEXT NOT NULL,
    basis_id     TEXT NOT NULL,
    rel          TEXT NOT NULL
                 CHECK (rel IN ('applied','assessed','cited','supersedes')),
    PRIMARY KEY (decision_id, basis_type, basis_id, rel)
);

CREATE INDEX decision_basis_target_idx ON decision_basis (basis_type, basis_id, rel);


-- ===========================================================================
-- Walking the basis graph. A recursive join, and nothing more exotic.
-- ===========================================================================

-- Everything decision 'CLM-0001' rests on, and everything those rest on:
--
--   WITH RECURSIVE reach(decision_id, basis_type, basis_id, rel, depth) AS (
--       SELECT decision_id, basis_type, basis_id, rel, 1
--       FROM   decision_basis
--       WHERE  decision_id = 'CLM-0001'
--       UNION ALL
--       SELECT b.decision_id, b.basis_type, b.basis_id, b.rel, reach.depth + 1
--       FROM   decision_basis b
--       JOIN   reach ON reach.basis_id = b.decision_id
--       WHERE  reach.depth < 10
--   )
--   SELECT * FROM reach ORDER BY depth, basis_type, basis_id;
--
-- The depth guard is belt and braces. The edges cannot form a cycle, because
-- a decision can only cite what already existed.
