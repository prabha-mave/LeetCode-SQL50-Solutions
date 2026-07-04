# Write your MySQL query statement below

/*
select product_id,
    min(year) as first_year,
    quantity,
    price
from sales
group by product_id, quantity, price  - wrong answer because i didn't includequantity and price group by*/



with first_year as(
    select 
        product_id, 
        min(year) as first_year
    from sales
    group by product_id
)
select 
    ft.product_id,
    ft.first_year,
    s.quantity,
    s.price
from first_year ft
join sales s
on ft.product_id = s.product_id
and s.year = ft.first_year
