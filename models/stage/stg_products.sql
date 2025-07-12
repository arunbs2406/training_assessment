{{
    config(
        materialized= "table"
    )
}}

with products as 
    (
    select 
		sku as product_id,
		name as product_name,
		type as product_type,
		description as product_desc,
		price/100 as product_price,
		case when type = 'jaffle' then 1 else 0 end as is_food_item,
		case when type = 'beverage' then 1 else 0 end as is_drink_item
    from {{ source("src", "products") }}
    )
select *
from products