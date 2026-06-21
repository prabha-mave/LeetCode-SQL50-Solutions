/* Write your T-SQL query statement below */

select p.product_id, 
    round(
        isnull(
            cast(sum(p.price*us.units) as float)
            /nullif (sum(us.units),0),
        0),            
    2) as average_price
from prices p
left join unitssold us
on p.product_id = us.product_id
and us.purchase_date between p.start_date and p.end_date
group by p.product_id


-- CAST(column AS datatype)
-- CAST(5 + 3 AS datatype)
-- CAST(price * quantity AS datatype)
-- CAST(SUM(sales) AS datatype)
-- CAST(MAX(salary) AS datatype)
-- all are valid