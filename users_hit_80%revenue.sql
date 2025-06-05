with monthly_revenue_vs_creditlimit as (
    select distinct
        t.user_id,
        extract(month from t.date) as month,
        sum(t.amount) as total_spend,
        c.credit_limit as card_limit,
        round((sum(t.amount)/c.credit_limit) * 100, 2) as percentage_utilized
    from transactions_data as t 
    join cards_data as c on t.user_id = c.user_id  
    where  
        c.card_type = 'Credit' and extract(year from t.date) = 2019
    group by 
        t.user_id,
        extract(month from t.date),
        c.credit_limit
    having
        sum(t.amount) >= 0.8 * c.credit_limit and c.credit_limit > 0
    order by 
         extract(month from t.date),
         t.user_id
)
select * from monthly_revenue_vs_creditlimit;
