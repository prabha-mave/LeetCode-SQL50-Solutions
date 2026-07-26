-- Write your PostgreSQL query statement below
with cte as (
    select product_id,
    new_price,
    change_date,
    row_number() over (
        partition by product_id
        order by change_date desc
    ) as rn
    from products
    where change_date <= '2019-08-16'
)
select product_id, new_price as price
from cte
where rn = 1

union all

select product_id, 10 as price
from products
group by product_id
having min(change_date) > '2019-08-16'