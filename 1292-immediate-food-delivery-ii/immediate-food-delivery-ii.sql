-- Write your PostgreSQL query statement below
with cte as (
    select *, 
    (case when order_date=customer_pref_delivery_date then 1 else 0 end) as order_type,
    row_number() over(partition by customer_id order by order_date) as order
    from delivery
)
select round(avg(order_type)*100.0,2) as immediate_percentage 
from cte
where "order" = 1
