select 
    t.user_id as user,
    c.credit_limit,
    sum(t.amount) as total_spend
from 
    transactions_data as t
join cards_data as c on t.user_id = c.user_id
group by 
    t.user_id,
    c.credit_limit
order by 
    c.credit_limit desc ; 