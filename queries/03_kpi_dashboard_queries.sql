-- ============================================================
-- KPI DASHBOARD QUERIES
-- ============================================================

-- 1. Genel Özet Metrikleri (Total Revenue, Orders, AOV)
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_order_value (AOV)
FROM orders
WHERE status = 'Completed';

-- 2. Aylık Ciro ve Sipariş Büyüme Trendi (MoM Growth)
SELECT 
    DATE_TRUNC('month', order_date) AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    ROUND(
        (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date))) 
        / LAG(SUM(total_amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) * 100, 2
    ) AS revenue_growth_percentage
FROM orders
WHERE status = 'Completed'
GROUP BY sales_month
ORDER BY sales_month;

-- 3. En Çok Satan Ürün Kategorileri ve Ciro Payı
SELECT 
    p.category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS category_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price) * 100.0 / SUM(SUM(oi.quantity * oi.unit_price)) OVER (), 2
    ) AS revenue_share_percentage
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 4. Sipariş Durumu Dağılımı (Tamamlanan, İptal, İade Oranları)
SELECT 
    status,
    COUNT(order_id) AS order_count,
    ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER (), 2) AS percentage
FROM orders
GROUP BY status;
