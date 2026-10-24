-- Starter tables for decision records. Postgres.
--
-- One fact table per domain, at that domain's own grain. One shared dimension.
-- One child table for basis_refs. Nothing here merges two domains.
--
-- Columns are grouped by conformance profile: see ../spec/PROFILES.md.
-- Not executed in this repository; see ../example/README.md for what was.

-- ===========================================================================
-- The conformed dimensions. Load these from ../spec/vocab/*.csv.
-- Every domain that adopts this points at the same copy of these tables.
-- ===========================================================================

CREATE TABLE dim_reason_class (
    value       text PRIMARY KEY,
    parent      text,                       -- the locus: who can act on it.
                                            -- NULL for conformed and other -- see the seed below
    status      text NOT NULL,              -- stable | provisional | deprecated
    definition  text NOT NULL
);

CREATE TABLE dim_locus (
    value       text PRIMARY KEY,
    parent      text NOT NULL,              -- the posture: conformed | departed
    status      text NOT NULL,
    definition  text NOT NULL
);

ALTER TABLE dim_reason_class
    ADD CONSTRAINT dim_reason_class_locus_fk
    FOREIGN KEY (parent) REFERENCES dim_locus (value);

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
-- One domain's fact table, at that domain's own grain:
-- one row per judged attempt.
-- ===========================================================================

CREATE TABLE claim_assessments (
    -- Core ------------------------------------------------------------------
    decision_id      text        PRIMARY KEY,
    task_type        text        NOT NULL,
    decided_at       timestamptz NOT NULL,
    outcome          text        NOT NULL
                     CHECK (outcome IN ('accepted','edited','rejected','abandoned')),
    reason_class     text        NOT NULL REFERENCES dim_reason_class (value),
    class_map_version text       NOT NULL,   -- which code->class mapping assigned the class above.
                                 -- reason_class is WRITTEN HERE, not joined at query time, so a
                                 -- later remapping cannot rewrite history. This records which
                                 -- mapping was in force, so a shift in a cell can be explained.

    -- Standard ---------------------------------------------------------------
    task_id          text        NOT NULL,
    attempt          integer     NOT NULL DEFAULT 1 CHECK (attempt >= 1),
    decided_by       text        NOT NULL,   -- pseudonymous; never a named person
    worker_kind      text        NOT NULL
                     CHECK (worker_kind IN ('person','agent','deterministic_code','person_with_agent')),
    reason_code      text        NOT NULL,   -- LOCAL. This domain's own words
    decide_seconds   numeric     CHECK (decide_seconds >= 0),
    confidence       numeric     CHECK (confidence >= 0 AND confidence <= 1),
                                 -- OPTIONAL. How sure the decider was, at the time.
                                 -- One scale, used consistently. Meaningful only when
                                 -- read back against outcome; never trusted on its own.

    -- Full -------------------------------------------------------------------
    standard_set_at  timestamptz NOT NULL,
    data_class       text        NOT NULL,   -- your own classification scheme
    detected_automatically text  NOT NULL CHECK (detected_automatically IN ('yes','no')),
    decision_automation    text  NOT NULL
                     CHECK (decision_automation IN ('fully','partially','not_automated')),

    -- Recommended -------------------------------------------------------------
    proposed_outcome text        CHECK (proposed_outcome IN ('accepted','edited','rejected','abandoned')),
    model_id         text,
    reason_text      text        CHECK (reason_text IS NULL OR length(reason_text) <= 500),

    -- The rules the schema states, enforced where the data lives --------------
    CONSTRAINT standard_precedes_decision
        CHECK (standard_set_at <= decided_at),
    CONSTRAINT other_class_carries_text
        CHECK (reason_class <> 'other' OR reason_text IS NOT NULL),
    CONSTRAINT proposal_implies_person_with_agent
        CHECK (proposed_outcome IS NULL OR worker_kind = 'person_with_agent'),

    UNIQUE (task_id, attempt)
);

CREATE INDEX claim_assessments_class_idx ON claim_assessments (reason_class);
CREATE INDEX claim_assessments_when_idx  ON claim_assessments (decided_at);

-- A second domain is the same shape with its own name, its own task_type
-- values and its own reason_code list. It is never merged with the first.
-- CREATE TABLE code_reviews ( ... as above ... );


-- ===========================================================================
-- basis_refs: one row per edge. Keys, never copies.
-- ===========================================================================

CREATE TABLE decision_basis (
    decision_id  text NOT NULL,
    basis_type   text NOT NULL,             -- policy | claim | report | decision | dataset | model
    basis_id     text NOT NULL,             -- version it if it is versionable
    rel          text NOT NULL
                 CHECK (rel IN ('applied','assessed','cited','supersedes')),
    PRIMARY KEY (decision_id, basis_type, basis_id, rel)
);

CREATE INDEX decision_basis_target_idx ON decision_basis (basis_type, basis_id, rel);

-- That index is the one that pays for the table: it answers
-- "which decisions applied the policy version we have just replaced"
-- without a scan.

-- decision_basis deliberately carries no foreign key to any one fact table,
-- because several domains write into it. Enforce the reference in the loader,
-- or add a per-domain view with a key if your domain has only one table.


-- ===========================================================================
-- Drilling across, as a view. Add a branch per domain.
-- ===========================================================================

CREATE VIEW departures_by_locus AS
SELECT   d.parent AS locus,
         f.task_type,
         COUNT(*) AS decisions
FROM     claim_assessments f
JOIN     dim_reason_class  d ON d.value = f.reason_class
GROUP BY d.parent, f.task_type;
-- UNION ALL the same block for each further domain. The domains meet in the
-- dimension and nowhere else.
