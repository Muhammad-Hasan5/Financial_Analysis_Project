with user_LTV as (
    select 
        user_id as user,
        sum(amount) as total_LTV
    from 
        transactions_data
    group by 
        user_id
    order by 
        sum(amount) desc 
)
select 
    c.card_type,
    sum(total_LTV)
from 
    user_LTV as u 
join cards_data as c on u.user = c.user_id
group by 
    c.card_type