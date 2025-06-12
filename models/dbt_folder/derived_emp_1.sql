{{ config(materialized='view') }}

SELECT right(emp_id, 3) as last_emp_id, left(emp_id, 3) as first_emp_id,emp_id, substr(emp_id, 4, 6) as sub_emp_id, employee_id
FROM {{ ref('stg_emptechdetails') }} etd
INNER JOIN {{ ref('stg_empworkdata') }} ewd
ON TRIM(RIGHT(emp_id,3)) = TRIM(RIGHT(employee_id,3))
WHERE etd.emp_id = 'emp025' 

