
-- Total Customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Total Orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Orders per customer
SELECT customer_id, COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_id;

-- Revenue per order
SELECT 
  o.order_id,
  SUM(p.price * oi.quantity) AS order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;
