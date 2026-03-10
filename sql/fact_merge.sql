MERGE INTO fact_orders f
USING final_orders s
ON f.order_id = s.order_id

WHEN MATCHED THEN
UPDATE SET
    f.customer_key = s.customer_key,
    f.order_date = s.order_date,
    f.quantity = s.quantity,
    f.unit_price = s.unit_price,
    f.net_amount = s.net_amount

WHEN NOT MATCHED THEN
INSERT (
    order_id,
    customer_key,
    order_date,
    quantity,
    unit_price,
    net_amount
)
VALUES (
    s.order_id,
    s.customer_key,
    s.order_date,
    s.quantity,
    s.unit_price,
    s.net_amount
);