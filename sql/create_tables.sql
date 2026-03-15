USE DATABASE DE_LAB;
USE SCHEMA ECOM;

CREATE OR REPLACE TABLE stg_orders (
    order_id VARCHAR,
    customer_id VARCHAR,
    order_date DATE,
    quantity INTEGER,
    unit_price NUMBER,
    created_timestamp TIMESTAMP
);
CREATE OR REPLACE TABLE fact_orders (
    order_id VARCHAR,
    customer_key INTEGER,
    order_date DATE,
    quantity INTEGER,
    unit_price NUMBER,
    net_amount NUMBER
);

CREATE OR REPLACE TABLE dim_customer (
    customer_key INTEGER,
    customer_id VARCHAR,
    customer_name VARCHAR,
    city VARCHAR,
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN
);