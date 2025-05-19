-- Categorize the average number of transactions per customer per month by frequency category

WITH tx_summary AS (
    SELECT
        s.owner_id,
        COUNT(s.id) AS total_transactions,
        COUNT(DISTINCT DATE_FORMAT(s.created_on, '%Y-%m')) AS active_months,
        (COUNT(s.id) / NULLIF(COUNT(DISTINCT DATE_FORMAT(s.created_on, '%Y-%m')), 0)) AS avg_tx_per_month
    FROM savings_savingsaccount s
    GROUP BY s.owner_id
)
SELECT
    CASE
        WHEN avg_tx_per_month >= 10 THEN 'High Frequency'
        WHEN avg_tx_per_month >= 3 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(owner_id) AS customer_count,
    ROUND(AVG(avg_tx_per_month), 1) AS avg_transactions_per_month
FROM tx_summary
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');