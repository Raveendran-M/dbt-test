{{ config(materialized='table') }}

WITH customers as
(
  SELECT * FROM `neon-mesh-452005-v4.raveetest.customers`
),
orders as 
(
  SELECT * FROM `neon-mesh-452005-v4.raveetest.orders`
)
SELECT cust.customer_id,CONCAT(first_name, ' ', last_name) as customer_name, email, order_id from customers cust
INNER JOIN orders orders
ON cust.customer_id = orders.customer_id
order by 1