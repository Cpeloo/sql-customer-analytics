WITH first_purchase AS (
    SELECT 
        customer_id,
        DATE_TRUNC('month', MIN(order_date)) AS cohort_month
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
),
activity AS (
    SELECT 
        o.customer_id,
        fp.cohort_month,
        DATE_TRUNC('month', o.order_date) AS activity_month,
        (EXTRACT(YEAR FROM o.order_date) - EXTRACT(YEAR FROM fp.cohort_month)) * 12 +
        (EXTRACT(MONTH FROM o.order_date) - EXTRACT(MONTH FROM fp.cohort_month)) AS month_number
    FROM orders o
    JOIN first_purchase fp ON o.customer_id = fp.customer_id
    WHERE o.status = 'Completed'
)
SELECT 
    cohort_month,
    month_number,
    COUNT(DISTINCT customer_id) AS active_users
FROM activity
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;
