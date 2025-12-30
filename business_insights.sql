
-- Insight: High value customers
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Insight: Return Rate
SELECT 
  COUNT(r.return_id) * 100.0 / COUNT(o.order_id) AS return_percentage
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id;

-- Insight: Payment Failure Analysis
SELECT payment_status, COUNT(*) AS count
FROM payments
GROUP BY payment_status;
