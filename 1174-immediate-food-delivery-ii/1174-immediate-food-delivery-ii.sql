with first_order as (
    select customer_id, min(order_date) as first_order
    from delivery
    group by customer_id
)
select 
    round(
        avg(
            case
                when d.order_date = d.customer_pref_delivery_date  
                then 100.0
                else 0
            end
        ),
        2
    ) as immediate_percentage

from delivery d
join first_order f
on d.customer_id = f.customer_id
and d.order_date = f.first_order