-- Write your PostgreSQL query statement below
with cte as (
    select  player_id,
        device_id,
        event_date,
        row_number() over (partition by player_id order by event_date) as order,
        lead(event_date) over (order by player_id, event_date) - event_date as dif
    from activity
) select round(sum(case when "order" = 1 and "dif" = 1 then 1 else 0 end)::decimal/count(distinct player_id),2) as fraction 
from cte 


