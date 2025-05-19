-- Find all active accounts (savings or investments) with no inflow transactions in the last 1 year (365 days)
SELECT
    s.plan_id,
    s.owner_id,
    CASE
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Other'
    END AS type,
    DATE(MAX(s.created_on)) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.created_on)) AS inactivity_days
FROM savings_savingsaccount s
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY s.plan_id, s.owner_id, type
HAVING inactivity_days > 365
ORDER BY inactivity_days DESC;