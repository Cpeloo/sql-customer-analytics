# E-Commerce Customer Analytics & Insights Engine

This repository contains SQL-based customer analytics queries for an e-commerce platform, focusing on **RFM Segmentation** and **Cohort Retention Analysis** using advanced SQL techniques (CTEs, Window Functions).

## 📁 Repository Structure
- `schema.sql`: Database tables definition (Customers, Products, Orders, Order Items).
- `data.sql`: Mock transaction data for testing.
- `queries/`: SQL scripts for RFM and Cohort Analysis.

## 📊 Key Analytics Included

### 1. RFM (Recency, Frequency, Monetary) Analysis
Categorizes customers into segments (Champions, At Risk, Lost, etc.) based on purchasing behavior to target retention campaigns.

### 2. Cohort Retention Analysis
Tracks monthly customer retention rates over time using window functions to measure repeat purchase dynamics.

### 3. Executive KPI Dashboard Queries (`queries/03_kpi_dashboard_queries.sql`)
Designed to power executive BI dashboards (Power BI, Tableau, Metabase) with core business metrics and monthly trends:
- **Core Sales Metrics:** Total Orders, Revenue, and Average Order Value (AOV).
- **MoM Revenue Growth:** Calculates Month-over-Month growth rates using `LAG()` window functions.
- **Category Share Analysis:** Evaluates revenue distribution across product categories using `SUM() OVER()` partition dynamics.
- **Order Fulfillment Breakdown:** Monitors completion, cancellation, and return rates to identify potential operational bottlenecks.

## 🚀 How to Run
1. Execute `schema.sql` to build tables.
2. Run `data.sql` to populate sample dataset.
3. Run scripts in the `queries/` folder for insights.
