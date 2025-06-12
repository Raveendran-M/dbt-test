SELECT 
city_code, 
city, 
month, 
avg_temp_fahrenheit, 
{{ to_celsius('avg_temp_fahrenheit') }} as avg_temp_celsius
from neon-mesh-452005-v4.raveetest.city_temperature