{{ config(materialized='table') }}

SELECT 
OS.customer_id, 
C.customer_name,
SUM(OS.ordercount) as ordercount,
SUM(OS.revenue) as revenue
FROM {{ ref('orders_fact') }} OS
JOIN {{ ref('customer_stg') }} C
ON OS.customer_id = C.customer_id
GROUP BY 1,2