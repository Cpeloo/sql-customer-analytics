# E-Commerce Customer Analytics & Insights Engine

This repository contains SQL-based customer analytics queries for an e-commerce platform, focusing on **RFM Segmentation** and **Cohort Retention Analysis** using advanced SQL techniques (CTEs, Window Functions).

## 📁 Repository Structure
- `schema.sql`: Database tables definition (Customers, Products, Orders, Order Items).
- `data.sql`: Mock transaction data for testing.
- `queries/`: SQL scripts for RFM and Cohort Analysis.
- ```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : included_in

    CUSTOMERS {
        int customer_id PK
        string first_name
        string last_name
        date signup_date
        string city
    }
    PRODUCTS {
        int product_id PK
        string product_name
        string category
        decimal price
    }
    ORDERS {
        int order_id PK
        int customer_id FK
        date order_date
        decimal total_amount
        string status
    }
    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal unit_price
    }

## 📊 Key Analytics Included

### 1. RFM (Recency, Frequency, Monetary) Analysis
Categorizes customers into segments (Champions, At Risk, Lost, etc.) based on purchasing behavior to target retention campaigns.

### 2. Cohort Retention Analysis
Tracks monthly customer retention rates over time using window functions to measure repeat purchase dynamics.

## 🚀 How to Run
1. Execute `schema.sql` to build tables.
2. Run `data.sql` to populate sample dataset.
3. Run scripts in the `queries/` folder for insights.
