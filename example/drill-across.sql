-- Three questions, answered across two decision tables that are never joined
-- to each other.
--
-- The two fact tables have different grains, different columns and different
-- local vocabularies. The only thing they share is dim_reason_class. There is
-- no join between claim_assessments and code_reviews anywhere in this file:
-- each is summarised separately against the shared dimension, and the two
-- summaries are stacked. That is what drilling across means.
--
-- The answers are in expected-output.txt, computed by make-example.pl rather
-- than asserted. See README.md for what has and has not been executed here.


-- ===========================================================================
-- 1. Departures by locus. The question neither team could ask alone.
--    Portable: plain joins, UNION ALL and GROUP BY only, so this runs on
--    SQLite, MySQL, Postgres, DuckDB, SQL Server, Snowflake and BigQuery.
-- ===========================================================================

SELECT   locus,
         SUM(claim_assessments) AS claim_assessments,
         SUM(code_reviews)      AS code_reviews,
         SUM(claim_assessments) + SUM(code_reviews) AS total
FROM     (
             SELECT d.parent AS locus, COUNT(*) AS claim_assessments, 0 AS code_reviews
             FROM   claim_assessments c
             JOIN   dim_reason_class  d ON d.value = c.reason_class
             GROUP  BY d.parent

             UNION ALL

             SELECT d.parent AS locus, 0 AS claim_assessments, COUNT(*) AS code_reviews
             FROM   code_reviews     r
             JOIN   dim_reason_class d ON d.value = r.reason_class
             GROUP  BY d.parent
         ) stacked
GROUP BY locus
ORDER BY total DESC, locus;


-- ===========================================================================
-- 2. How often a person changed what software proposed.
--    Only rows with worker_kind = 'person_with_agent' carry proposed_outcome,
--    so the denominator is defined by the data rather than by a filter.
-- ===========================================================================

SELECT   task_type,
         COUNT(*) AS proposed,
         SUM(CASE WHEN proposed_outcome <> outcome THEN 1 ELSE 0 END) AS changed_by_person
FROM     (
             SELECT task_type, proposed_outcome, outcome FROM claim_assessments
             WHERE  proposed_outcome IS NOT NULL AND proposed_outcome <> ''
             UNION ALL
             SELECT task_type, proposed_outcome, outcome FROM code_reviews
             WHERE  proposed_outcome IS NOT NULL AND proposed_outcome <> ''
         ) with_proposal
GROUP BY task_type
ORDER BY task_type;


-- ===========================================================================
-- 3. What basis_refs is for: every decision made under a governing record.
--    This is the list you want on the morning a policy changes.
-- ===========================================================================

SELECT   b.basis_type, b.basis_id, COUNT(*) AS decisions
FROM     decision_basis b
WHERE    b.rel = 'applied'
GROUP BY b.basis_type, b.basis_id
ORDER BY decisions DESC, b.basis_id;

-- Narrow it to one version, and you have the work to re-check by name:
--
--   SELECT decision_id FROM decision_basis
--   WHERE  rel = 'applied' AND basis_type = 'policy' AND basis_id = 'motor-v9';


-- ===========================================================================
-- An alternative shape for query 1, where the engine supports it.
-- FULL OUTER JOIN works in Postgres, DuckDB, Snowflake, BigQuery and SQL
-- Server, and reads more directly. SQLite before 3.39 and MySQL 5.x lack it,
-- which is why the portable form above is the one presented first.
-- ===========================================================================
--
--   WITH claims AS (
--       SELECT d.parent AS locus, COUNT(*) AS n
--       FROM   claim_assessments c JOIN dim_reason_class d ON d.value = c.reason_class
--       GROUP  BY d.parent
--   ), reviews AS (
--       SELECT d.parent AS locus, COUNT(*) AS n
--       FROM   code_reviews r JOIN dim_reason_class d ON d.value = r.reason_class
--       GROUP  BY d.parent
--   )
--   SELECT COALESCE(claims.locus, reviews.locus)           AS locus,
--          COALESCE(claims.n, 0)                           AS claim_assessments,
--          COALESCE(reviews.n, 0)                          AS code_reviews,
--          COALESCE(claims.n, 0) + COALESCE(reviews.n, 0)  AS total
--   FROM   claims
--   FULL OUTER JOIN reviews ON reviews.locus = claims.locus
--   ORDER  BY total DESC, locus;
