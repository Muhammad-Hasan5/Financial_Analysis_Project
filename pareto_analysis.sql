with user_revenue as (
    select 
        user_id,
        sum(amount) as total_revenue
    from
        transactions_data
    group by
        user_id
), ordered_revenue as (
    select
        user_id,
        total_revenue,
        sum(total_revenue) over(order by total_revenue desc) as cumulative_revenue,
        sum(total_revenue) over() as overall_revenue
    from
        user_revenue
), revenue_percent as (
    select 
        user_id,
        total_revenue,
        cumulative_revenue,
        round((cumulative_revenue * 100) / overall_revenue, 2) as cumulative_percentage,
        overall_revenue
    from
        ordered_revenue
)
select
    *
from 
    revenue_percent
where 
    cumulative_percentage <= 80;