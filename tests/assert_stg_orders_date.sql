with orders as (
    select * from {{ref("stg_orders")}}
)

select *
from orders
group by order_id,order_date,customer_id,status
having year(order_date) > 2018

/* Tests will pop up an error if the code in a singular test doenst amount to 0 results */