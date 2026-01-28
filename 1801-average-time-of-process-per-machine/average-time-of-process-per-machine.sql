-- Write your PostgreSQL query statement below

select machine_id, round(avg(diff)::numeric,3) as processing_time
from (
    select machine_id, process_id, max(timestamp)-min(timestamp) as diff
    from activity
    group by machine_id, process_id
) as t1
group by machine_id
