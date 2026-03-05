# FinTech Fraud Analytics Pipeline

End-to-end analytics engineering project analyzing fraudulent financial transactions using a modern data stack.

## Tech Stack

Python  
PostgreSQL  
dbt  
Power BI  

## Data Source

IEEE-CIS Fraud Detection Dataset  
~590k transactions

## Architecture

Raw Data → Python ETL → PostgreSQL Warehouse → dbt Transformations → Analytics Marts → Power BI Dashboard

## Pipeline

1. Data ingestion using Python
2. Warehouse modeling in PostgreSQL
3. Data transformation using dbt
4. Data quality tests using dbt
5. Analytics marts for fraud insights
6. Power BI dashboard for visualization

## Key Insights

Fraud risk varies by:
- Device type
- Transaction size
- Email domain
- Geographic location

## Dashboard

Executive overview, fraud segmentation, and hotspot analysis.