-- Write your PostgreSQL query statement below
with ranked as (
    select salary, dense_rank() over(order by salary desc) as r 
    from employee
)
select salary as "SecondHighestSalary"
from ranked 
where r = 2
union all
select null 
limit 1;