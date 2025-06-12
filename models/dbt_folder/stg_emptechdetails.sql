{{ config(materialized='table') }}

SELECT 
JSON_EXTRACT_SCALAR(json_data, '$.id') as emp_id,
JSON_EXTRACT_SCALAR(json_data, '$.personal_info.email') as personal_email,
JSON_EXTRACT_SCALAR(json_data, '$.employment.dept') as dept,
JSON_EXTRACT_SCALAR(ph, '$.status') as status,
JSON_EXTRACT_SCALAR(phases, '$.') as phases,
JSON_EXTRACT_SCALAR(ph, '$.project.name') as project_name,
JSON_EXTRACT_SCALAR(tech, '$.') as tech ,
CAST(JSON_EXTRACT_SCALAR(ph, '$.project.details.team_size') AS INT64) AS team_size,
JSON_EXTRACT_SCALAR(json_data, '$.projects.active_projects') as active_projects,
JSON_EXTRACT_SCALAR(json_data, '$.skills.certifications') as certifications,
JSON_EXTRACT_SCALAR(dates, '$.') as training_dates
FROM cloudside-academy.ravee_dbt.employee_json_data,
UNNEST(JSON_EXTRACT_ARRAY(json_data, '$.projects.project_history')) AS ph,
UNNEST(JSON_EXTRACT_ARRAY(ph, '$.project.phases')) as phases,
UNNEST(JSON_EXTRACT_ARRAY(ph, '$.project.details.tech')) as tech,
UNNEST(JSON_EXTRACT_ARRAY(json_data, '$.skills.training_dates')) as dates




