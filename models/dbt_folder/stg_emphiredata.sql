{{ config(materialized='view') }}

WITH config AS (
  SELECT 
    ['Jan', 'Feb', 'Mar'] AS month,
    '2025-06-01' AS report_data,
    29 AS user_age,
    hire_date,
    employee_id,
    department
  FROM `cloudside-academy.ravee_dbt.sam`
)

SELECT config.* EXCEPT(month), m
FROM config, UNNEST(month) AS m
