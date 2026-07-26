-- Write your PostgreSQL query statement below
with first_date as(
    select player_id, min(event_date) as first_date
    from activity
    group by player_id
)
select
    round(
        count(distinct a.player_id) :: numeric/ 
        (select count(distinct player_id) from activity),
        2) as fraction
from activity a
join first_date f
on a.player_id = f.player_id
and a.event_date = f.first_date + interval '1 day'