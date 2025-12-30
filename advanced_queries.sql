
-- Customer Lifetime Value (CLV)
SELECT 
  c.customer_id,
  c.full_name,
  SUM((p.price - p.cost) * oi.quantity) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.full_name
ORDER BY lifetime_value DESC;

-- Repeat Customers using CTE
WITH order_count AS (
  SELECT customer_id, COUNT(order_id) AS total_orders
  FROM orders
  GROUP BY customer_id
)
SELECT *
FROM order_count
WHERE total_orders > 1;

-- Top Product per Category (Window Function)
SELECT *
FROM (
  SELECT 
    cat.category_name,
    p.product_name,
    SUM(oi.quantity) AS total_sold,
    RANK() OVER(PARTITION BY cat.category_name ORDER BY SUM(oi.quantity) DESC) AS rnk
  FROM order_items oi
  JOIN products p ON oi.product_id = p.product_id
  JOIN categories cat ON p.category_id = cat.category_id
  GROUP BY cat.category_name, p.product_name
) t
WHERE rnk = 1;
