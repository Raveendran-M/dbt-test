{{ config(materialized='table') }}

WITH
  first_column AS (
  SELECT
    e.job_info AS job_info,
    e.job_info.projects,
    e.personal_info AS per,
    employees,
    e.student_id,
    e.employee_id
  FROM
    cloudside-academy.ravee_dbt.employee_data,
    UNNEST(employees)e )
SELECT
  p.status,
  p.project_name,
  p.project_id,
  per.email,
  job_info.date_of_joining,
  job_info.department,
  employee_id
FROM
  first_column,
  UNNEST(projects) p 
