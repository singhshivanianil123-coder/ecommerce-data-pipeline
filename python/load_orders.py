import pandas as pd
from datetime import datetime
from snowflake_connection import get_connection

df = pd.read_csv("data/orders.csv")

df["created_timestamp"] = datetime.now()

conn = get_connection()
cursor = conn.cursor()

for _, row in df.iterrows():

    cursor.execute(
        """
        INSERT INTO stg_orders
        (order_id, customer_id, order_date, quantity, unit_price, created_timestamp)
        VALUES (%s,%s,%s,%s,%s,%s)
        """,
        (
            row["order_id"],
            row["customer_id"],
            row["order_date"],
            int(row["quantity"]),
            float(row["unit_price"]),
            row["created_timestamp"]
        )
    )

conn.commit()
cursor.close()
conn.close()