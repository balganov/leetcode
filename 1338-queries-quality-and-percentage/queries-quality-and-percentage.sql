-- Write your PostgreSQL query statement below
select query_name,
        round(avg(rating::decimal/position),2) as quality,
        round((count(rating) filter (where rating<3)*100.0)/count(*),2) as poor_query_percentage
from queries
group by query_name