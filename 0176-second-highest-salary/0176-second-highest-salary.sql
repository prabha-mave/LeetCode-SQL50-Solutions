# Write your MySQL query statement below

/*select max(salary) as SecondHighestSalary 
from employee
where salary < (select max(salary) from employee)*/

with salaryrank as(
    select salary,
    dense_rank() over (order by salary desc) as rnk
    from employee
)
select max(salary) as SecondHighestSalary
from salaryrank
where rnk = 2 