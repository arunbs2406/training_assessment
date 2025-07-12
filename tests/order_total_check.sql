select 
    order_id,
    sum(order_total) sum_order_total
from
    {{ref('stg_orders')}}
group by
    order_id
having
    sum_order_total <= 4


