SELECT
    email_domain,
    COUNT(*) AS transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(SUM(is_fraud)::numeric / COUNT(*),4) AS fraud_rate
FROM {{ ref('stg_transactions') }}
GROUP BY email_domain
ORDER BY fraud_rate DESC
LIMIT 50