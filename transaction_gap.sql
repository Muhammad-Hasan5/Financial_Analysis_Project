with sorted_transactions as (
    select 
        t.user_id,
        c.card_type,
        t.date,
        lag(t.date) over (partition by t.user_id order by t.date) as prev_date
    from transactions_data as t
    join cards_data as c on t.user_id = c.user_id
    group by 
        t.user_id,
        c.card_type,
        t.date
),
gaps as (
    select 
        user_id,
        card_type,
        date - prev_date as gap_in_days
    from sorted_transactions
    where prev_date is not null
)
select 
    user_id,
    card_type,
    AVG(gap_in_days) as avg_gap_bw_transactions
from gaps
group by 
    user_id, 
    card_type;

 