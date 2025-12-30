CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  full_name VARCHAR(100),
  email VARCHAR(100),
  city VARCHAR(50),
  signup_date DATE
);

CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category_id INT,
  price DECIMAL(10,2),
  cost DECIMAL(10,2),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_status VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  discount DECIMAL(5,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_mode VARCHAR(30),
  payment_status VARCHAR(20),
  payment_date DATE,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE shipping (
  shipping_id INT PRIMARY KEY,
  order_id INT,
  shipped_date DATE,
  delivered_date DATE,
  delivery_status VARCHAR(20),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE returns (
  return_id INT PRIMARY KEY,
  order_id INT,
  return_reason VARCHAR(100),
  return_date DATE,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
