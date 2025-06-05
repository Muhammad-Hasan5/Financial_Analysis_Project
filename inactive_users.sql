with user_yearly_income as (
    select 
        user_id,
        case 
            when yearly_income < 20000 then 'Low income'
            when yearly_income between 20000 and 50000 then 'Low-Middle income'
            when yearly_income between 50000 and 100000 then 'Middle income'
            when yearly_income between 100000 and 200000 then 'High-Middle income'
            else 'High income'
        end as income_segment,
        case
            when current_age between 0 and 17 then 'young'
            when current_age between 18 and 34 then 'young-adult'
            when current_age between 35 and 54 then 'middle-aged'
            else 'old'
        end as age_segment 
    from 
        users_data
    group by 
        user_id
    order by user_id
), active_users as (
    select 
        user_id,
        extract(year from date) as year
    from transactions_data                                           
), last_year_active_users as (
    select 
        user_id
    from 
        active_users  
    where  
        year = (select max(year) from active_users) - 1
), present_year_active_users as (
    select 
        user_id
    from 
        active_users  
    where  
        year = (select max(year) from active_users) 
), churned_users as (
    select 
        user_id
    from 
        last_year_active_users
    where 
        user_id not in (select user_id from present_year_active_users) 
)
select
    u.*
from 
    user_yearly_income as u 
join churned_users as c on u.user_id = c.user_id 
group by 
    u.user_id,
    u.income_segment,
    u.age_segment