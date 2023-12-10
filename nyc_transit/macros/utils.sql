{% macro convert_flag_to_bool(column_name, true_val="Y", false_val="N", null_value=" ") -%}
(case
    when {{column_name}} = '{{true_val}}' then true
    when {{column_name}} = '{{false_val}}' then false
    when {{column_name}} = '{{null_value}}' then null
    when {{column_name}} is null then null
    else {{column_name}}
end)::bool
{%- endmacro %}