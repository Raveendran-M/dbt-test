{{ config(materialized='incremental') }}

SELECT  
EXTRACT(day from CAST(CAST(report_data AS TIMESTAMP) AS DATE)) as day, 
FORMAT_DATE('%B',  CAST(CAST(report_data AS TIMESTAMP) AS DATE)) as month , 
EXTRACT(year from CAST(CAST(report_data AS TIMESTAMP) AS DATE)) as year, 
DATE_DIFF(CAST(report_data AS TIMESTAMP), CAST(hire_date AS TIMESTAMP), day)  as date_diff
FROM {{ ref('stg_emphiredata') }} ehd
LEFT JOIN {{ ref('derived_emp_1') }} demp
ON TRIM(SUBSTR(ehd.employee_id,4,6)) = TRIM(RIGHT(demp.employee_id,3))
WHERE demp.employee_id IS NOT NULL
