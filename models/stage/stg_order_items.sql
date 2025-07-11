with order_items as 
    (
    select 
        id as order_item_id,
        sku as product_id
    from {{ source("src", "items") }}
    )
select *
from order_items
