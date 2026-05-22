select 
    productId
    productname,
    category,
    subcategory,
    sum(orderprofit) as profit
from {{ ref('stage_orders') }}
group by
    productId,
    productname,
    category,
    subcategory

