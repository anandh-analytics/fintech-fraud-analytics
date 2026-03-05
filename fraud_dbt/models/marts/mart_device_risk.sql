SELECT
    device_type,
    COUNT(*) AS transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(SUM(is_fraud)::numeric / COUNT(*),4) AS fraud_rate
FROM {{ ref('stg_transactions') }}
GROUP BY device_type
ORDER BY fraud_rate DESC