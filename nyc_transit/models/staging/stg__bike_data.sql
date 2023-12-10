with source as (
    select * from {{ source('main', 'bike_data') }}
),

renamed as (

    select
        tripduration,
        starttime,
        stoptime,
        "start station id",
        "start station name",
        "start station latitude",
        "start station longitude",
        "end station id",
        "end station name",
        "end station latitude",
        "end station longitude",
        bikeid,
        usertype,
        "birth year",
        gender,
        ride_id,
        rideable_type,
        started_at,
        ended_at,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual,
        filename

    from source

)

select * from renamed