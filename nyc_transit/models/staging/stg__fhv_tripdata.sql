with source as (
    select * from {{ source('main', 'fhv_tripdata') }}
),

renamed as (

    select
        trim(upper(dispatching_base_num)) as dispatching_base_num, --make all base_num uppercase
        pickup_datetime,
        dropoff_datetime,
        pulocationid,
        dolocationid,
        {{convert_flag_to_bool("sr_flag")}} as sr_flag,
        affiliated_base_number,
        filename

    from source

)

select * from renamed