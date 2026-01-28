-- Write your PostgreSQL query statement below
with temp as(
    select 
    id,
    temperature,
    recordDate,
    lag(temperature) over (order by recordDate) as nt,
    lag(recordDate) over (order by recordDate) as rd
    from weather
)
select id from temp 
where temperature > nt
and rd - recordDate = -1
