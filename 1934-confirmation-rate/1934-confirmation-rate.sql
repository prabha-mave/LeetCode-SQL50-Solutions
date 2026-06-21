/* Write your T-SQL query statement below */

select
    s.user_id,
    round(
        isnull(
            cast(
                sum(
                    case
                        when c.action = 'confirmed'
                        then 1
                        else 0
                    end
                )as float
            )/nullif(count(c.action), 0),
            0
        ),
        2
    ) as confirmation_rate
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id


-- COUNT() counts non-NULL values, not non-zero values.
-- CAST() function in SQL Server is a built-in tool used to explicitly convert an expression or value from one data type to another
-- ISNULL(check_expression, replacement_value)
-- NULLIF(expression1, expression2) means: If expression1 = expression2, return NULL