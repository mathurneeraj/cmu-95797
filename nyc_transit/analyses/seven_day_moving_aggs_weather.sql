-- Write a query to calculate the 7 day moving min, max, avg, sum for precipitation and snow
-- for every day in the weather data, defining the window only once.(Named Windows)

select date,
    min(prcp) over seven_days as prcp_min,
    max(prcp) over seven_days as prcp_max,
    avg(prcp) over seven_days as prcp_avg,
    sum(prcp) over seven_days as prcp_sum,

    min(snow) over seven_days as snow_min,
    max(snow) over seven_days as snow_max,
    avg(snow) over seven_days as snow_avg,
    sum(snow) over seven_days as snow_sum

from {{ ref('stg__central_park_weather') }}

window seven_days as (
    order by date range between interval 3 days preceding and interval 3 days following )
order by date;