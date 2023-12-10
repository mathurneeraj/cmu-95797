-- Compare an individual fare to the zone, borough and overall average fare
-- using the fare_amount in yellow taxi trip data
select 
    fare_amount, -- individual fare
    zone, avg(fare_amount) over (partition by zone) zone_avg_fare, -- zone fare
    borough, avg(fare_amount) over (partition by borough) borough_avg_fare -- overall borough fare
from {{ ref('stg__yellow_tripdata') }} yellow
join {{ ref('mart__dim_locations') }} loc on yellow.pulocationid = loc.locationid;