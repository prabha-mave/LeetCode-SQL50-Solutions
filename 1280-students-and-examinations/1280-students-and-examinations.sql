/* Write your T-SQL query statement below */
select st.student_id, st.student_name, sb.subject_name, count(ex.subject_name) as attended_exams
from students st
cross join subjects sb
left join examinations ex
on sb.subject_name = ex.subject_name
and st.student_id = ex.student_id
group by st.student_id, st.student_name, sb.subject_name
order by st.student_id, sb.subject_name
