with int_orders as
(
    SELECT 
    i.order_item_id as order_item_id ,
	o.order_id as order_id, 
	o.location_id as location_id, 
	o.customer_id as customer_id, 
	i.product_id as product_id,
	o.order_total as order_total, 
	o.tax_paid as tax_paid , 
	o.ordered_at as ordered_at,
    {{convert_currency_euro('o.order_total')}} as order_total_Euro,
    {{convert_currency_yen('o.order_total')}} as order_total_Yen
FROM 
	{{ref('stg_orders') }} o
INNER JOIN
	{{ref('stg_order_items') }} i
ON 
	o.order_id = i.order_id
{% if is_incremental() %}
WHERE 
    o.ordered_at > '{{var('order_after_date')}}'
{% endif %}
)
select * from int_orders