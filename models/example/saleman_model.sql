
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{{ config(materialized="table") }}

with
    source_data as (

        select
            user_id,
            email,
            code_name,
            system_id,
            concat(last_name, ' ', first_name) as full_name,
            title,
            status,
            role,
            date_of_birth
        from `base-datateam.db_system.user_info`
        where metatype <> 'guest'
        order by system_id asc, user_id asc
    )

select *
/*
    Uncomment the line below to remove records with null `id` values
*/
-- where id is not null
from source_data
