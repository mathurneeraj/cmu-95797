-- Select borough from the mart__dim_locations by joining location id with pickup location id from mart__fact_all_taxi_trips
select 
    loc.borough, 
    count(trip.*) as trips
from {{ ref('mart__fact_all_taxi_trips') }} trip 
join {{ ref('mart__dim_locations') }} loc on trip.pulocationid = loc.locationid 
group by all 