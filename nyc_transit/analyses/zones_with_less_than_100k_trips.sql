-- Find all zones where there are less than 100000 trips
select zone, count(trip.*) trips  
from {{ ref('mart__fact_all_taxi_trips') }} trip 
join {{ ref('mart__dim_locations') }} loc on trip.pulocationid = loc.locationid 
group by all 
having trips < 100000