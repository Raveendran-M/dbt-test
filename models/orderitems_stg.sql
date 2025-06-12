SELECT 
item_id, 
order_id, 
product_name,
SUM(quantity * price) as totalprice,
quantity,
price 
FROM `neon-mesh-452005-v4.raveetest.order_items`
GROUP BY 1,2,3,5,6
ORDER BY 1