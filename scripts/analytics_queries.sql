-- Top 5 customers by points
SELECT customer_id, full_name, total_points
FROM CUSTOMERS
ORDER BY total_points DESC
FETCH FIRST 5 ROWS ONLY;

-- Monthly purchase totals
SELECT TO_CHAR(purchase_date, 'YYYY-MM') AS month, SUM(total_amount) AS total_sales
FROM PURCHASES
GROUP BY TO_CHAR(purchase_date, 'YYYY-MM')
ORDER BY month;

-- Redemption trends by reward
SELECT rw.reward_name, COUNT(*) AS times_redeemed, SUM(points_deducted) AS total_points_used
FROM REDEMPTIONS r
JOIN REWARDS rw ON r.reward_id = rw.reward_id
GROUP BY rw.reward_name
ORDER BY times_redeemed DESC;

-- Points earned vs points redeemed per customer
SELECT c.customer_id, c.full_name,
       SUM(p.points_earned) AS total_earned,
       SUM(r.points_deducted) AS total_redeemed,
       (SUM(p.points_earned) - SUM(r.points_deducted)) AS net_points
FROM CUSTOMERS c
LEFT JOIN PURCHASES p ON c.customer_id = p.customer_id
LEFT JOIN REDEMPTIONS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY net_points DESC;

-- Weekend vs weekday purchases
SELECT CASE WHEN TO_CHAR(purchase_date, 'DY') IN ('SAT','SUN') THEN 'Weekend' ELSE 'Weekday' END AS day_type,
       COUNT(*) AS purchase_count,
       SUM(total_amount) AS total_sales
FROM PURCHASES
GROUP BY CASE WHEN TO_CHAR(purchase_date, 'DY') IN ('SAT','SUN') THEN 'Weekend' ELSE 'Weekday' END;
