select 
--from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit, 
o.ordercostprice,
o.ordersellingprice,
--from raw customer
c.customerId,
c.customername, 
c.segment,
c.country,
-- from raw product
p.productId,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerId = c.customerId
left join {{ ref('raw_products') }} as p
on o.productId = p.productId