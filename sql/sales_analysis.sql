CREATE DATABASE Sales_Analytics;
USE Sales_Analytics;
CREATE TABLE sales_data (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    year INT,
    month INT,
    profit_margin FLOAT
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/Users/bindhusaahithinaralashettyyogendranath/Desktop/Sales-Analytics/Data/cleaned/sales_cleaned.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM sales_data;

SELECT * FROM sales_data
LIMIT 5;

-- Total Sales
SELECT SUM(sales) AS total_sales
FROM sales_data;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM sales_data;

-- Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Sales by Category
SELECT category, SUM(sales) AS total_sales
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- Top 10 Products
SELECT product_name, SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT year, month, SUM(sales) AS total_sales
FROM sales_data
GROUP BY year, month
ORDER BY year, month;


