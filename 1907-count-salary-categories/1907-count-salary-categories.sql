-- Write your PostgreSQL query statement below
/*select 'Low Salary' as category, count(*) as accounts_count
from accounts
where income <=20000

* COUNT(*) without GROUP BY on an empty set $\rightarrow$ Returns 1 row with value 0.COUNT(*) with GROUP BY on an empty set $\rightarrow$ Returns 0 rows.*

union all

select 'Average Salary' as category, count(*) as accounts_count
from accounts
where income between 20000 and 50000


union all

select 'High Salary' as category, count(*) as accounts_count
from accounts
where income >=50000 */


with category as ( 
    select 'Low Salary' as category
    union all
    select 'Average Salary' as category
    union all
    select 'High Salary' as category
)
select c.category, count(a.account_id) as accounts_count
from category c
left join accounts a
on (c.category = 'Low Salary' and income < 20000)
or (c.category = 'Average Salary' and income between 20000 and 50000)
or (c.category = 'High Salary' and income > 50000)
group by c.category
/*We use LEFT JOIN because we want all three salary categories to appear, even if there are no accounts in one or more categories.*/