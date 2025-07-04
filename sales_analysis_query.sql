--  Select the database
USE retail_sales;

-- Create normalized source tables

CREATE TABLE order_details (
    customerID VARCHAR(255),
    productID VARCHAR(255),
    quantity INT,
    sales DOUBLE,
    profit DOUBLE
);

SELECT * FROM order_details;

CREATE TABLE customers (
    customerID VARCHAR(255),
    name VARCHAR(255),
    segment VARCHAR(255),
    customerRegion VARCHAR(255)
);

SELECT * FROM customers;

CREATE TABLE products (
    productID VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255),
    product_name VARCHAR(255)
);

SELECT * FROM products;

CREATE TABLE orders (
    orderID VARCHAR(255),
    order_date VARCHAR(255),
    ship_date VARCHAR(255),
    customerID VARCHAR(255),
    region VARCHAR(255)
);

SELECT * FROM orders;

-- Rename column for clarity
ALTER TABLE customers 
CHANGE `name` customerName VARCHAR(255);

-- Create final Sales_Table using LEFT JOINs

CREATE TABLE sales_table AS
SELECT 
    c.customerID,
    c.customerName,
    c.segment,
    c.customerRegion,

    o.orderID,
    o.order_date,
    o.ship_date,
    o.region AS order_region,

    od.productID,
    od.quantity,
    od.sales,
    od.profit,

    p.category,
    p.sub_category,
    p.product_name
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID
LEFT JOIN order_details od ON o.orderID = od.orderID
LEFT JOIN products p ON p.productID = od.productID;

SELECT * FROM sales_table;

-- Profit classification by product category and sub-category

SELECT 
    category, 
    sub_category,
    CASE 
        WHEN profit < 0 THEN 'Loss'
        WHEN profit > 0 THEN 'Profit'
        ELSE 'No Profit No Loss'
    END AS profit_status
FROM sales_table;

-- Top 5 customers by total sales

SELECT 
    customerName, 
    SUM(sales) AS total_sales
FROM sales_table
GROUP BY customerName
ORDER BY total_sales DESC
LIMIT 5;

-- Customer who placed the maximum number of orders

SELECT 
    customerName, 
    COUNT(orderID) AS total_orders_placed
FROM sales_table
GROUP BY customerName
ORDER BY total_orders_placed DESC
LIMIT 1;

-- Customers who never placed an order

SELECT customerName
FROM sales_table
WHERE orderID IS NULL;

-- Average profit per customer segment

SELECT 
    segment, 
    AVG(profit) AS average_profit
FROM sales_table
GROUP BY segment
ORDER BY average_profit DESC;

-- Top 5 most sold products by quantity

SELECT 
    product_name, 
    SUM(quantity) AS total_units_sold
FROM sales_table
GROUP BY product_name
ORDER BY total_units_sold DESC
LIMIT 5;
