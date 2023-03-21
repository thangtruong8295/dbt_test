
{{ config(materialized='table') }}

with source_data_v1 as (

SELECT user_id, email, code_name, system_id, CONCAT(last_name,' ',first_name) as full_name, title, status, role,date_of_birth FROM `base-datateam.db_system.user_info` where metatype <> 'guest'
order by system_id asc, user_id asc

)

select *
from source_data_v1