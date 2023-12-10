-- Write a query to calculate the 7 day moving average precipitation for every day in the weather data
-- The 7 day window should center on the day in question (for each date, the 3 days before, the data & 3 days after)
select 
    date,
    avg(prcp) over( order by date range between interval 3 days preceding and interval 3 days following ) as prcp_seven_day_average 
from {{ ref('stg__central_park_weather') }} 
order by date;