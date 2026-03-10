CREATE OR REPLACE TABLE stg_orders (
    order_id VARCHAR,
    customer_id VARCHAR,
    order_date DATE,
    quantity INTEGER,
    unit_price NUMBER
);

CREATE OR REPLACE TABLE fact_orders (
    order_id VARCHAR,
    customer_key INTEGER,
    order_date DATE,
    quantity INTEGER,
    unit_price NUMBER,
    net_amount NUMBER
);