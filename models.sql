-- Staging tables
CREATE TABLE stg_tpch_orders AS
SELECT * FROM tpch.orders;

CREATE TABLE stg_tpch_line_items AS
SELECT * FROM tpch.lineitem;

-- Intermediate tables
CREATE TABLE int_order_items AS
SELECT l.l_orderkey, l.l_partkey, l.l_quantity, l.l_extendedprice, o.o_orderstatus
FROM stg_tpch_line_items l
JOIN stg_tpch_orders o ON l.l_orderkey = o.o_orderkey;

CREATE TABLE int_order_items_summary AS
SELECT l_orderkey, SUM(l_quantity) AS total_quantity, SUM(l_extendedprice) AS total_price
FROM int_order_items
GROUP BY l_orderkey;

-- Fact table
CREATE TABLE fct_orders AS
SELECT i.l_orderkey, i.total_quantity, i.total_price, o.o_orderstatus
FROM int_order_items_summary i
JOIN stg_tpch_orders o ON i.l_orderkey = o.o_orderkey;

-- Tests
SELECT COUNT(*) FROM fct_orders WHERE o_orderstatus NOT IN ('P', 'O', 'F');
