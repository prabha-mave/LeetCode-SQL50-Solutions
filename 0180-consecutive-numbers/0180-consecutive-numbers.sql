-- Write your PostgreSQL query statement below
/*select distinct l1.num as ConsecutiveNums 
from logs l1
join logs l2 on l2.id = l1.id+1
join logs l3
on l3.id = l2.id+1
where l1.num = l2.num
and l2.num = l3.num */

with cte as (
    select num,
    lead(num,1) over (order by id) as next_num,
    lead(num,2) over (order by id) as next_next_num
    from logs
)
select distinct num as ConsecutiveNums 
from cte
where num = next_num
and num = next_next_num
