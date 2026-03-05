SELECT
    location,

    COUNT(*) AS transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(SUM(is_fraud)::numeric / COUNT(*),4) AS fraud_rate,
    ROUND(AVG(transaction_amt)::numeric,2) AS avg_transaction_amt

FROM {{ ref('stg_transactions') }}

GROUP BY location
HAVING COUNT(*) > 200
ORDER BY fraud_rate DESC
LIMIT 100