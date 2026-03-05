import pandas as pd
from pathlib import Path

# Get project root directory
BASE_DIR = Path(__file__).resolve().parents[2]

# Define file paths
transactions_path = BASE_DIR / "data/raw/train_transaction.csv"
identity_path = BASE_DIR / "data/raw/train_identity.csv"

# Load transaction data
transactions = pd.read_csv(transactions_path)

# Load identity data
identity = pd.read_csv(identity_path)

# Merge datasets
df = transactions.merge(identity, on="TransactionID", how="left")

print("Rows:", df.shape)

# Select important columns for analysis
columns = [
    "TransactionID",
    "TransactionAmt",
    "ProductCD",
    "card4",
    "card6",
    "addr1",
    "dist1",
    "P_emaildomain",
    "DeviceType",
    "isFraud"
]

df = df[columns]

# Basic cleaning
df["dist1"] = df["dist1"].fillna(0)
df["DeviceType"] = df["DeviceType"].fillna("unknown")

# Create processed directory if it doesn't exist
processed_dir = BASE_DIR / "data/processed"
processed_dir.mkdir(parents=True, exist_ok=True)

output_path = processed_dir / "transactions_clean.csv"

df.to_csv(output_path, index=False)

print("Clean dataset saved:", output_path)
