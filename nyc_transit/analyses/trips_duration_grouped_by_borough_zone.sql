-- Calculate the number of trips and average duration by borough and zone
select
    borough, 
    zone, 
    count(*) as trips, 
    avg(duration_min) avg_duration_min
from {{ ref('mart__fact_all_taxi_trips') }} trip
join {{ ref('mart__dim_locations') }} loc on trip.dolocationid = loc.locationid
group by borough, zone;