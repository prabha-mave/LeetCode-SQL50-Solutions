-- Write your PostgreSQL query statement below

with cte as(
    select requester_id as user_id
    from requestaccepted
    union all
    select accepter_id as user_id
    from requestaccepted)
select user_id as id, count(user_id) as num
from cte
group by user_id
order by num desc
limit 1

-- UNION removes duplicate rows from the combined result set, while UNION ALL includes all rows, keeping duplicates.

/*
select sub.id, count(sub.id) as num
from requestaccepted,
    lateral (values(requester_id), (accepter_id)) as sub(id)
group by sub.id
order by num desc
limit 1*/