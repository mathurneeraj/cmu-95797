-- Find the average time between taxi pick ups per zone
with next_pickup as
    (
        -- Use lead or lag to find the next trip per zone for each record
        -- then find the time difference between the pick up time for the current record and the next
        -- then use this result to calculate the average time between pick ups per zone.
        select
            zone, 
            --datediff(pickup_datetime, lag(pickup_datetime) over (partition by zone order by pickup_datetime)) as next_pickup_time
            datediff('minute', pickup_datetime, lead(pickup_datetime) over (partition by zone order by pickup_datetime)) as next_pickup_time
        from {{ ref('mart__fact_all_taxi_trips') }} trip
        join {{ ref('mart__dim_locations') }} loc on trip.pulocationid = loc.locationid
    )

select 
    zone, 
    avg(next_pickup_time) as avg_time_between_pickups
from next_pickup
group by all;