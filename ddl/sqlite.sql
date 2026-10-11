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
    parent      TEXT NOT NULL REFERENCES dim_locus (value),
    status      TEXT NOT NULL,              -- stable | provisional | deprecated
    definition  TEXT NOT NULL
);


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

    -- Standard
    task_id          TEXT NOT NULL,
    attempt          INTEGER NOT NULL DEFAULT 1 CHECK (attempt >= 1),
    decided_by       TEXT NOT NULL,         -- pseudonymous; never a named person
    worker_kind      TEXT NOT NULL
                     CHECK (worker_kind IN ('person','agent','deterministic_code','person_with_agent')),
    reason_code      TEXT NOT NULL,         -- LOCAL. This domain's own words
    decide_seconds   REAL CHECK (decide_seconds >= 0),

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
