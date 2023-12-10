-- Use Window functions with QUALIFY and ROW_NUMBER to remove duplicate rows
-- prefer rows with a later time stamp
with events as (
    select
        event_id,
        event_type,
        user_id,
        insert_timestamp,
        event_timestamp
    from {{ ref('events') }}
)

select *
from events 
qualify row_number() over (partition by event_id order by event_timestamp desc) = 1