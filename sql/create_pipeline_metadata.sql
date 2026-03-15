USE DATABASE DE_LAB;
USE SCHEMA ECOM;

CREATE OR REPLACE TABLE pipeline_metadata (
    pipeline_name VARCHAR,
    last_processed_ts TIMESTAMP
);