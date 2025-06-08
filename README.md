# 💳 Financial Data Analysis using SQL

## 📌 Overview

This project performs a deep dive into revenue, sales, user behavior and financial patterns using SQL queries on transaction and user demographic data. It aims to provide insights for business strategy, such as identifying high-value users, churn patterns, card utilization, and income-based and age-based segmentation.

## 📂 Datasets

### 1. `users_data`
- `user_id`: Unique identifier for each user
- `yearly_income`: Annual income of the user
- `current_age`: Age of the user
- `retirement_age` : Age of user's retirement
- `birth_year` : Birth year of user
- `birth_month` : Birth month of user
- `gender` : Sex of user
- `address` : Street where user lives
- `latitude` : latitude of the area
- `longitude` : longitude of the area
- `per_capita_income` : Per capita income of the area
- `total_debt` : User's debt
- `credit_score` : Credit card score of user
- `num_credit_cards` : Number of credit cards of user

### 2. `transactions_data`
- `transaction_id` : Unique identifier for each transaction
- `date` : Date of each transaction
- `user_id` : Unique identifier for each user
- `card_id` : Unique identifier for each card
- `amount` : Amount spent on each transaction
- `merchant_id` : Unique identifier for each merchant
- `merchant_city` : City of a merchant
- `merchant_state` : State of the merchant
- `zip` : Zip code of merchant area
- `mcc` : Merchant Category Code (mcc) unique identifier for merchant category
- `errors` : If error during transaction

### 3. `cards_data`
- `card_id` : Unique identifier for each card
- `user_id` : Unique identifier ofr each user
- `card_brand` : Brand of a card
- `card_type` : Type of card (credit, debit)
- `card_number` : A unique card number
- `expires` : Date of card expiration
- `cvv` : security code of card
- `has_chip` : Flag whether card has chip or not
- `num_cards_issued` : Number of cards issued for each user
- `credit_limit` : Limit of amount a user can reach
- `acct_open_date` : Date on which user opened account
- `year_pin_last_changed` : Year when user changed card pin last
- `card_on_dark_web` : Flag whether card is on dark web or not

### 4. `mcc_codes`
- `mcc` : Unique identifier for each merchant category
- `business_type` : Name of business category

---

# 🧠 Business Questions & SQL Insights

## 📊 User Behavior & Lifetime Value


### 🔎 Q1: Which card types are associated with the highest user lifetime value? 

**Objective**: Finding out which card types are mostly used by users by total revenue.

**🖥️ Querry**: [userLTV_by_cardtype.sql](/userLTV_by_cardtype.sql) 

**📊 Visualization**: ![User_LTV_by_card_type](/user_LTV_by_cardtype.png)

**Key Findings**:
- Users having Debit card have highest Life Time Value.
- Users having Credit card are second highest.
- While the users having Debit pre-paid cards have lowest LTV.

**Strategic Recommendation**:
- **Double Down Debit Card Users**:
   1. Run loyalty or upsell campaigns specifically for debit card users.
   2. Encourage debit card users to refer others — especially from similar demographic/behavior groups.
   3. Tailor promotions that align with their spending behavior (e.g., cashback, rewards on specific categories).
- **Upsell Credit Card Users**:
   1. Introduce offers to shift them toward debit card-linked benefits (if applicable) or premium services.
   2.  Use subscription models, loyalty points, or app features that increase engagement.
- **Re-engage or Phase Out Debit Prepaid Card Users**:
   1.  Offer limited-time discounts or personalized incentives to increase engagement.
   2. If prepaid users consistently show low returns, avoid spending heavily on acquisition. Treat them as a low-priority audience in marketing budget.



### 🔎 Q2: What is the average time between transactions for repeat users, and how does this vary by card type? 

**Objective**: Finding out average time transactions made by users by and how this time is varying by card type.

**🖥️ Querry**: [transaction_gap.sql](/transaction_gap.sql) 

**📊 Visualization**: ![transaction_gap](/transaction_gap.png)

**Key Findings**:
- **High Frequency of Short Gaps**: 

     A very high frequency of transactions with very short time gaps, predominantly within the first 1-2 days. This indicates that a large portion of active users engage in transactions very frequently, often on a daily or every-other-day basis.
- **Long Tail of Infrequent Transactions**: 
   While most transactions are frequent, there's a long tail extending to much larger time gaps (e.g., beyond 5-10 days), indicating a segment of users who transact much less frequently. This could represent less engaged users or those who use the service for less regular, larger purchases.

**Strategic Recommendation**:
- **Optimize for Frequent Engagement**: 
   Given the high frequency of short transaction gaps, focus on optimizing the user experience for daily or near-daily engagement. This could include features like quick payment options, personalized daily deals, or push notifications for common recurring transactions to further solidify this frequent usage pattern.
- **Re-engagement Strategies for Infrequent Users**: Develop targeted re-engagement campaigns for users identified in the "long tail" of transaction gaps. This could involve sending personalized reminders, special offers for inactive accounts, or surveying these users to understand their reasons for infrequent use and address potential pain points.

### 🔎 Q3: How many users who were active in the past year became inactive in the last 6 months? Group by income and age.

**Objective**: Segmenting inactive users of this year who were active last year on the basis of age and 
income bracket.

**🖥️ Querry**: [inactive_users.sql](/inactive_users.sql) 


**Key Findings**:
- Only three users were inactive in last six months belongs to middle-age and old age group with middle-income and middle class group.
- Over all user engagement results are excellent.

**Strategic Recommendation**:

 Continue the user engagement campaigns and strategies used in last cohort and scale them to much larger level to acheive 100% user engagement.If possible try to strategize and run campaigns for middle class group more, respective to age groups.


---

## 💳 Spending Patterns & Card Usage

### 🔎 Q4: What percentage of users hit more than 80% of their credit card limit monthly last year? Identify high-utilization users.

**Objective**: Identifying number/percentage of users who spent 80% of their credit card limit last year.

**🖥️ Querry**: [users_hit_80%_revenue.sql](/users_hit_80%25revenue.sql) 

**📊 Visualization**: ![user_hit_80%_revenue](/user_hit_80_revenue.png)

**Key Findings**:
- **Significant Number of Users Exceed 80% Utilization, with a Skew Towards Higher Utilization**:

    A substantial number of users not only hit the 80% utilization mark but often significantly exceed it, with a notable portion even going above 100%. This indicates that these users are highly reliant on their credit or are pushing their limits, potentially leading to higher interest revenue but also higher risk.
- **Concentration of Users in the 80%-100% Range**: 

   While many users exceed 100% utilization, there is a prominent concentration of users whose utilization falls within the 80% to 100% range. This group represents users who are consistently maximizing their available credit without necessarily going over their limit, making them prime candidates for specific interventions.

**Strategic Recommendation**:
- **Proactive Credit Limit Management for High Utilizers**: 

  For users consistently hitting or exceeding 80% utilization, consider a proactive approach to credit limit management. This could involve offering selective, responsible credit limit increases to users with good payment histories to capture more spending and improve customer satisfaction, or providing financial advisory to users who frequently exceed 100% utilization to mitigate default risk.
- **Targeted Engagement for Users Approaching Limits**: 

  Implement targeted communications and offers for users who are consistently in the 80%-100% utilization range. This segment is highly engaged and could be receptive to balance transfer offers, rewards programs, or even alternative financing options to encourage continued card usage and loyalty, while also managing potential credit risk.

### 🔎 Q5: Does a higher card limit correlate with a higher total spend?

**Objective**: Finding if there is any relation between high credit limit and high total spend.

**🖥️ Querry**: [creditlimit_vs_totalspend.sql](/cardlimit_vs_totalspend.sql) 

**📊 Visualization**: ![card_limit_vs._total_spend](/cardlimit_vs_totalspend.png)

**Key Findings**:
- There appears to be a general positive correlation between credit_limit and total_spend. Users with 
  higher credit limits tend to have higher total spending, although there is considerable variance.
- While there's a positive trend, the relationship isn't perfectly linear. There are instances where users with similar credit limits have vastly different total
  spending, and vice versa. This suggests that credit_limit is one of many factors influencing total_spend, but not the sole determinant.


**Strategic Recommendation**:
- **For High Spenders on Moderate Limits**: 

    Identify users who consistently spend a high proportion of their current credit limit but do not have the highest limits. Offering them a credit limit increase could unlock even higher spending and improve customer satisfaction.
  
- **For High Spenders with Low Limits**:

   Explore increasing limits for users with low limits but surprisingly high spending. They might be high-potential customers whose spending is currently capped by their limit.

### 🔎 Q6: Which 5% of users contribute to 80% of total revenue (Pareto analysis)?

**Objective**: Identifying users who contribute to 80% revenue.

**🖥️ Querry**: [pareto_analysis.sql](/pareto_analysis.sql) 

**📊 Visualization**: ![pareto_analysis](/pareto_analysis.png)

**Key Findings**:
- **Strong Positive Correlation between Credit Limit and Total Spend**:
- 
   A strong positive correlation, indicating that users with higher credit limits generally tend to have higher total spending. This suggests that credit limit is a significant driver or enabler of user spending behavior.
  
- **Presence of Underutilized High Credit Limits**:
   
   While there's a general trend, there are also users with relatively high credit limits who exhibit moderate to low total spending. This group represents potentially underutilized credit capacity.

**Strategic Recommendation**:
- **Strategically Increase Limits for Engaged Users**:

   For highly engaged users who are consistently maximizing their current credit limits and demonstrate good repayment behavior, consider strategically increasing their limits. This can encourage further spending and deepen their engagement, thereby maximizing revenue.
  
- **Re-engage Users with Underutilized High Limits**:

   Implement targeted campaigns or personalized offers for users with high credit limits but low total spending. This could involve promoting specific card features, offering incentives for increased usage, or conducting surveys to understand barriers to higher spending, aiming to unlock their full spending potential.

---

## 🧮 Income & Age Segmentation

```sql
-- Income Segments
< 20,000           → Low income  
20,000–50,000      → Low-Middle income  
50,000–100,000     → Middle income  
100,000–200,000    → High-Middle income  
> 200,000          → High income

-- Age Segments
0–17               → Young  
18–34              → Young Adult  
35–54              → Middle Aged  
55+                → Old

```
## 🛠 Tools Used:
- PostgreSQL (SQL)
- Visualizations : (Ms Excel + Gemini)
