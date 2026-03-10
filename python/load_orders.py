import pandas as pd
from snowflake_connection import get_connection

# Load CSV
df = pd.read_csv("data/orders.csv")

print("Orders data:")
print(df)

# Get Snowflake connection
conn = get_connection()
cursor = conn.cursor()

# Insert records
for _, row in df.iterrows():
    cursor.execute(
        """
        INSERT INTO stg_orders
        (order_id, customer_id, order_date, quantity, unit_price)
        VALUES (%s, %s, %s, %s, %s)
        """,
        (
            row["order_id"],
            row["customer_id"],
            row["order_date"],
            int(row["quantity"]),
            float(row["unit_price"])
        )
    )

conn.commit()
cursor.close()
conn.close()

print("Data loaded successfully!")