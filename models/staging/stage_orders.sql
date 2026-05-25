select 
--from raw orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
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
p.subcategory,
d.delivery_team,
{{ markup('ordersellingprice','ordercostprice') }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.customerId = c.customerId
left join {{ ref('raw_products') }} as p
on o.productId = p.productId
left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode