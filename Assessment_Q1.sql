-- Query to find customers with at least one funded savings plan and one funded investment plan, sorted by total deposits.

SELECT
    u.id AS owner_id,
    u.first_name AS name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 AND s.confirmed_amount > 0 THEN s.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 AND s.confirmed_amount > 0 THEN s.id END) AS investment_count,
    ROUND(SUM(s.confirmed_amount), 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY u.id, u.first_name
HAVING
    savings_count > 0
    AND investment_count > 0
ORDER BY total_deposits DESC
