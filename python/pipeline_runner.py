import subprocess
import logging
from run_sql import run_sql_file

# Configure logging
logging.basicConfig(
    filename="logs/pipeline.log",
    level=logging.INFO,
    format="%(asctime)s - %(message)s"
)

logging.info("Pipeline started")

try:

    logging.info("Creating tables")
    run_sql_file("sql/create_tables.sql")

    logging.info("Seeding dimension table")
    run_sql_file("sql/seed_dim_customer.sql")

    logging.info("Loading CSV data")
    subprocess.run(["python", "python/load_orders.py"])

    logging.info("Deduplicating orders")
    run_sql_file("sql/deduplicate_orders.sql")

    logging.info("Creating final dataset")
    run_sql_file("sql/create_final_orders.sql")

    logging.info("Merging into fact table")
    run_sql_file("sql/fact_merge.sql")

    logging.info("Pipeline completed successfully")

    logging.info("Checking duplicates")
    run_sql_file("sql/check_duplicate_orders.sql")

    logging.info("Checking dimension join failures")
    run_sql_file("sql/check_dimension_failures.sql")

    logging.info("Validating row counts")
    run_sql_file("sql/check_row_counts.sql")

    logging.info("Updating watermark in stage table")
    run_sql_file("sql/update_watermark.sql")

    logging.info("Collecting pipeline metrics")
    run_sql_file("sql/pipeline_metrics.sql")

except Exception as e:

    logging.error(f"Pipeline failed: {e}")