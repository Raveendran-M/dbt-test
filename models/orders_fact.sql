{{ config(materialized='table') }}

SELECT 
O.order_id,
O.customer_id,
O.order_date,
O.amount,
O.customers,
COUNT(distinct O.order_id) as ordercount,
SUM(oi.totalprice) as revenue
FROM {{ ref('orders_stg') }} O
JOIN {{ ref('orderitems_stg') }} oi
ON O.order_id = oi.order_id
GROUP BY 1,2,3,4,5
ORDER BY 1
