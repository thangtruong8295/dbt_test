
-- Use the `ref` function to select from other models

select *
from {{ ref('saleman_model') }}
where id = 1
