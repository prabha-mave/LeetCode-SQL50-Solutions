/* Write your T-SQL query statement below */

select p.project_id, round(avg(cast (e.experience_years as decimal)),2) as average_years
from project p
join employee e
on p.employee_id = e.employee_id
group by p.project_id
order by p.project_id