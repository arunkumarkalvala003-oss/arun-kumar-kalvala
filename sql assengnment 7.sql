-- Create Tables
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
country VARCHAR(50)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT, -- Note: Contains NULLs for guest checkouts
product_id INT,
order_date DATE
);

-- Insert Mock Data
INSERT INTO customers VALUES 
(1, 'Alice Smith', 'USA'),
(2, 'Bob Jones', 'Canada'),
(3, 'Charlie Brown', 'UK'),
(4, 'Diana Prince', 'USA'); -- Has never placed an order

INSERT INTO products VALUES 
(101, 'Laptop', 1200.00),
(102, 'Smartphone', 800.00),
(103, 'Wireless Headphones', 150.00),
(104, 'Tablet', 400.00); -- Has never been ordered

INSERT INTO orders VALUES 
(5001, 1, 101, '2026-06-01'), -- Alice bought Laptop
(5002, 2, 102, '2026-06-02'), -- Bob bought Smartphone
(5003, 1, 103, '2026-06-03'), -- Alice bought Headphones
(5004, NULL, 101, '2026-06-04'); -- Guest checkout bought Laptop
----------------------------------
select * from orders
select * from products
select * from customers
--------------------------------

SELECT
customers.customer_id,
customers.customer_name,
orders.order_id,
orders.order_date,
products.product_id,
products.product_name
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN products
ON orders.product_id = products.product_id;
SELECT
customers.customer_id,
customers.customer_name,
orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT
products.product_id,
products.product_name,
orders.order_id
FROM orders
RIGHT JOIN products
ON orders.product_id = products.product_id;
SELECT
customers.customer_id,
customers.customer_name,
orders.order_id,
orders.product_id,
orders.order_date
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT
customers.customer_id,
customers.customer_name,
products.product_id,
products.product_name
FROM customers
CROSS JOIN products;
	