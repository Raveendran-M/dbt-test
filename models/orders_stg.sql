SELECT 
order_id,
customer_id,
order_date,
amount,
CASE WHEN customer_id <= 5 THEN 'Old customers'
WHEN customer_id >=6 THEN 'New customers'
END AS customers
FROM `neon-mesh-452005-v4.raveetest.orders`