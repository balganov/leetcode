-- Write your PostgreSQL query statement below
select name 
from employee t1
join (
    select managerId, count(*) as c
    from employee
    group by managerId
) as t2 on t1.id=t2.managerId 
where t2.c >= 5