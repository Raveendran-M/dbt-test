SELECT 
customer_id,
first_name,
last_name,
CONCAT(first_name,' ', last_name) as customer_name,
email, 
CONCAT(customer_id, '###') as encrypted_id
FROM {{ source('landing', 'cust') }}
--FROM `neon-mesh-452005-v4.raveetest.customers`
ORDER BY 1