-- Retrieve all customers
SELECT * FROM CUSTOMERS;

-- Retrieve all purchases with customer info
SELECT p.purchase_id, c.full_name, p.purchase_date, p.total_amount, p.points_earned
FROM PURCHASES p
JOIN CUSTOMERS c ON p.customer_id = c.customer_id;

-- Retrieve all rewards
SELECT * FROM REWARDS;

-- Retrieve all redemptions with customer and reward info
SELECT r.redemption_id, c.full_name, rw.reward_name, r.redemption_date, r.points_deducted
FROM REDEMPTIONS r
JOIN CUSTOMERS c ON r.customer_id = c.customer_id
JOIN REWARDS rw ON r.reward_id = rw.reward_id;

-- Check total points for a specific customer
SELECT customer_id, full_name, total_points
FROM CUSTOMERS
WHERE customer_id = 1;
