-- select * is performed on taxi+_zone_lookup seed file
select
  {{ dbt_utils.star(ref('taxi+_zone_lookup')) }}
from {{ ref('taxi+_zone_lookup') }}