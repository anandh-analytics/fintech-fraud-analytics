SELECT
    transaction_id,
    transaction_amt,
    product_cd,
    card_network,
    card_type,
    location,
    distance,
    email_domain,
    device_type,
    is_fraud
FROM fraud.fact_transactions