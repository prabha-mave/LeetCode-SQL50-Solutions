-- Write your PostgreSQL query statement below
with cte1 as (
    select visited_on, sum(amount) as amount1
    from customer
    group by visited_on
),
cte2 as(
    select visited_on, 
    sum(amount1) over (order by visited_on
        range between interval '6 days' preceding and current row) as amount,
    round( avg(amount1) over (order by visited_on
        range between interval '6 days' preceding and current row),2) as average_amount,
    row_number() over (order by visited_on) as rn
    from cte1
)
select 
    visited_on, 
    amount,
    average_amount
from cte2
where rn>= 7
order by visited_on