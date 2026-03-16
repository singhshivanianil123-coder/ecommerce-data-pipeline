import os
from snowflake_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

# Path to CSV
file_path = os.path.abspath("data/orders.csv")

print("Uploading file to Snowflake stage...")

cursor.execute(f"""
PUT file://{file_path} @orders_stage
AUTO_COMPRESS=TRUE
OVERWRITE=TRUE
""")

print("Loading data into stg_orders...")

cursor.execute("""
COPY INTO stg_orders
FROM @orders_stage
FILE_FORMAT = (
TYPE = CSV
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY='"'
)
""")

conn.commit()

cursor.close()
conn.close()

print("CSV loaded successfully using COPY INTO")