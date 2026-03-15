USE DATABASE DE_LAB;
USE SCHEMA ECOM;

SELECT
    (SELECT COUNT(*) FROM stg_orders) AS raw_count,
    (SELECT COUNT(*) FROM stg_orders_dedup) AS dedup_count,
    (SELECT COUNT(*) FROM final_orders) AS final_count;