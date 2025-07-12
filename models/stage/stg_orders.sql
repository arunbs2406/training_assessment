with orders as 
    (
    select 
        id as order_id,
        store_id as location_id,
        customer_id as customer_id,
        order_total/100 as order_total,
        tax_paid/100 as tax_paid,
        ordered_at::date as ordered_at
    from {{ source("src", "orders") }}
    where order_total > 0
    )
select *
from orders