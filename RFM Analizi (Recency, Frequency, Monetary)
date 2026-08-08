WITH customer_rfm AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        -- Recency: Son siparişten bu yana geçen gün sayısı (Referans Tarih: 2026-08-01)
        DATEDIFF('2026-08-01', MAX(o.order_date)) AS recency,
        -- Frequency: Toplam tamamlanan sipariş sayısı
        COUNT(DISTINCT o.order_id) AS frequency,
        -- Monetary: Toplam harcama tutarı
        SUM(o.total_amount) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, customer_name
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM customer_rfm
)
SELECT 
    customer_id,
    customer_name,
    recency, frequency, monetary,
    r_score, f_score, m_score,
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
        WHEN r_score <= 2 AND f_score >= 4 THEN 'At Risk / Need Attention'
        WHEN r_score <= 2 AND f_score <= 2 THEN 'Hibernating / Lost'
        ELSE 'Other'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;
