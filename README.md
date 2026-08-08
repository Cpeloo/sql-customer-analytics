# E-Commerce Customer Analytics & Insights Engine

An end-to-end, SQL-based data analytics project designed for e-commerce business intelligence. This project transforms raw transaction data into actionable business strategies using advanced SQL techniques such as **CTEs (Common Table Expressions)**, **Window Functions (`NTILE`, `LAG`, `SUM() OVER`)**, and **Complex Joins**.

---

## 📁 Repository Structure

```text
sql-customer-analytics/
│
├── schema/
│   └── schema.sql                  # Database table definitions & constraints
├── data/
│   └── data.sql                    # Mock transaction dataset for testing
├── queries/
│   ├── 01_rfm_analysis.sql         # RFM Segmentation script
│   ├── 02_cohort_retention.sql     # Monthly Cohort Retention script
│   └── 03_kpi_dashboard_queries.sql# Executive Dashboard KPI metrics
└── README.md                       # Documentation

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

📊 Key Analytics & Business Logic
1. Customer RFM Segmentation (queries/01_rfm_analysis.sql)
Segments customers into strategic groups (Champions, Loyal Customers, At Risk / Need Attention, Hibernating) based on their purchasing behavior:
Recency (R): Days since the customer's last purchase.
Frequency (F): Total number of completed orders.
Monetary (M): Total monetary value spent.
SQL Technique Used: NTILE(5) OVER(...) window functions to score behavior dynamically.

2. Cohort Retention Analysis (queries/02_cohort_retention.sql)
Tracks repeat purchase dynamics over time to calculate customer lifetime engagement:
Group customers into monthly cohorts based on their first purchase date.
Measures month-by-month activity (month_number) to track retention rates and churn points.
SQL Technique Used: Multi-stage CTEs, DATE_TRUNC, and date-difference math.

3. Executive KPI Dashboard Queries (queries/03_kpi_dashboard_queries.sql)
Provides backend logic for executive Business Intelligence dashboards (Power BI, Tableau, Metabase):
Core Sales Performance: Total Revenue, Total Orders, and Average Order Value (AOV).
Month-over-Month (MoM) Growth: Revenue trend tracking using LAG() functions.
Category Share Analysis: Evaluates category revenue distribution using SUM() OVER() partition dynamics.
Order Fulfillment Metrics: Monitors order completion vs. cancellation and return rates.

🚀 How to Run
Database Setup: Execute schema/schema.sql to build the database schema and foreign key constraints.
Populate Data: Run data/data.sql to populate sample transactions into the database.
Generate Insights: Execute any script inside the queries/ directory to generate analytics reports.

🛠️ Tech Stack & Skills Demonstrated
Database: PostgreSQL / MySQL compatible
SQL Skills: CTEs, Window Functions (NTILE, LAG, SUM() OVER), Aggregations, Multi-table Joins, Data Aggregation & Business Logic Translation.
