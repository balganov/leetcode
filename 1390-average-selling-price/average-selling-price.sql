-- Write your PostgreSQL query statement below
with cte as (
    select t1.product_id, coalesce(t2.units,0) as units, t1.price*coalesce(t2.units,0) as total from prices as t1
    left join UnitsSold as t2 on t1.product_id = t2.product_id 
    and t2.purchase_date between t1.start_date and t1.end_date
)
select product_id, coalesce(round(sum(total)::numeric/nullif(sum(units),0),2),0) as average_price from cte
group by product_id