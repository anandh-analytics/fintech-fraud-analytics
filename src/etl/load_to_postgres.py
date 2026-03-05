import psycopg2
from pathlib import Path

# Get project root
BASE_DIR = Path(__file__).resolve().parents[2]

file_path = BASE_DIR / "data/processed/transactions_clean.csv"

conn = psycopg2.connect(
    host="localhost",
    database="fintech_fraud",
    user="postgres",
    password="Vinoth@1997"
)

cur = conn.cursor()

with open(file_path, "r") as f:
    cur.copy_expert(
        """
        COPY fraud.fact_transactions (
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
        )
        FROM STDIN WITH (FORMAT CSV, HEADER TRUE);
        """,
        f
    )

conn.commit()

cur.close()
conn.close()

print("Data successfully loaded into PostgreSQL")