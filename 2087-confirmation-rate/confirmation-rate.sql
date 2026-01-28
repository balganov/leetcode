-- Write your PostgreSQL query statement below
select t1.user_id, round(coalesce(t2.c,0),2) as confirmation_rate
from signups as t1
left join (
    select user_id, count(*) filter (where action='confirmed')::decimal / nullif(count(*),0) as c
    from confirmations
    group by user_id
) as t2
on t1.user_id=t2.user_id
