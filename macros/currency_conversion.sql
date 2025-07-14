{% macro convert_currency_euro(column_name, scale=2) %}
    ({{ column_name }} * 0.46 )::numeric(16, {{ scale }})
{% endmacro %}

{% macro convert_currency_yen(column_name, scale=2) %}
     ({{ column_name }} * 147.26 )::numeric(16, {{ scale }})
{% endmacro %}