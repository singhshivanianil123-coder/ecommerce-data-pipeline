UPDATE pipeline_metadata
SET last_processed_ts = CURRENT_TIMESTAMP
WHERE pipeline_name = 'orders_pipeline';