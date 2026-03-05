SELECT
    CASE
        WHEN transaction_amt < 50 THEN 'Small'
        WHEN transaction_amt < 200 THEN 'Medium'
        WHEN transaction_amt < 500 THEN 'Large'
        ELSE 'Very Large'
    END AS transaction_bucket,

    COUNT(*) AS transactions,
    SUM(is_fraud) AS fraud_cases,
    ROUND(SUM(is_fraud)::numeric / COUNT(*),4) AS fraud_rate,
    ROUND(AVG(transaction_amt)::numeric,2) AS avg_transaction_amt

FROM {{ ref('stg_transactions') }}

GROUP BY 1
ORDER BY fraud_rate DESC