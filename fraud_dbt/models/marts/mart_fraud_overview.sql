SELECT
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND((SUM(is_fraud)::numeric / COUNT(*)), 4) AS fraud_rate,
    ROUND(AVG(transaction_amt)::numeric, 2) AS avg_transaction_amount
FROM {{ ref('stg_transactions') }}