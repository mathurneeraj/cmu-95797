-- find taxi trips which don't have a pick up locationid in the locations table
select trip.*
from {{ ref('mart__fact_all_taxi_trips') }} trip
left join {{ ref('mart__dim_locations') }} loc
on trip.pulocationid = loc.locationid
where loc.locationid is null