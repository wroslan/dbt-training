with
orders as (
    select * from {{ ref('raw_orders') }}
)

select 
    orderid,
    sum(ordersellingprice) as total_np
from orders
group by orderid
having total_np<0