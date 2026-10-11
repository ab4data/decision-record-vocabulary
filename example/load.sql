-- Loads the four CSVs in this directory. DuckDB dialect.
--   duckdb -c ".read load.sql" -c ".read drill-across.sql"

CREATE OR REPLACE TABLE dim_reason_class  AS SELECT * FROM read_csv_auto('dim_reason_class.csv',  header=true);
CREATE OR REPLACE TABLE claim_assessments AS SELECT * FROM read_csv_auto('claim_assessments.csv', header=true);
CREATE OR REPLACE TABLE code_reviews      AS SELECT * FROM read_csv_auto('code_reviews.csv',      header=true);
CREATE OR REPLACE TABLE decision_basis    AS SELECT * FROM read_csv_auto('decision_basis.csv',    header=true);

-- SQLite instead:
--   sqlite3 example.db
--   .mode csv
--   .import --skip 1 dim_reason_class.csv  dim_reason_class
--   .import --skip 1 claim_assessments.csv claim_assessments
--   .import --skip 1 code_reviews.csv      code_reviews
--   .import --skip 1 decision_basis.csv    decision_basis
-- (create the tables first from ../ddl/sqlite.sql, or let .import infer them
--  by dropping --skip 1 so the header row becomes the column names)

-- Postgres instead:
--   \copy dim_reason_class  FROM 'dim_reason_class.csv'  CSV HEADER
--   \copy claim_assessments FROM 'claim_assessments.csv' CSV HEADER
--   \copy code_reviews      FROM 'code_reviews.csv'      CSV HEADER
--   \copy decision_basis    FROM 'decision_basis.csv'    CSV HEADER
-- (create the tables first from ../ddl/postgres.sql)
