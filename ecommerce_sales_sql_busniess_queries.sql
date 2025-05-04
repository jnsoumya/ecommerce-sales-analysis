-- Question  1: Total Revenue by Country

WITH revenue_by_country AS (
    SELECT 
        country, 
        SUM(quantity * unit_price) AS total_revenue
    FROM 
        ecommerce_data
    GROUP BY 
        country
)
SELECT * FROM revenue_by_country
ORDER BY total_revenue DESC;

-- Question  2: Monthly Revenue Trend

WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', invoice_date) AS month, 
        SUM(quantity * unit_price) AS revenue
    FROM 
        ecommerce_data
    GROUP BY 
        month
)
SELECT * FROM monthly_revenue
ORDER BY month;

-- Question  3: Top Customers by Revenue

WITH customer_revenue AS (
    SELECT 
        customer_id, 
        SUM(quantity * unit_price) AS total_revenue
    FROM 
        ecommerce_data
    GROUP BY 
        customer_id
)
SELECT * FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- Question  4: Best-Selling Products

WITH best_selling_products AS (
    SELECT 
        stock_code, 
        description, 
        SUM(quantity) AS total_quantity_sold
    FROM 
        ecommerce_data
    GROUP BY 
        stock_code, description
)
SELECT * FROM best_selling_products
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Question  5: Product Revenue Contribution

WITH product_revenue AS (
    SELECT 
        stock_code, 
        description, 
        SUM(quantity * unit_price) AS total_revenue
    FROM 
        ecommerce_data
    GROUP BY 
        stock_code, description
)
SELECT * FROM product_revenue
ORDER BY total_revenue DESC;

-- Question  6: Average Revenue per Country

WITH revenue_by_country AS (
    SELECT 
        country, 
        SUM(quantity * unit_price) AS total_revenue
    FROM 
        ecommerce_data
    GROUP BY 
        country
)
SELECT 
    country, 
    AVG(total_revenue) AS average_revenue
FROM 
    revenue_by_country
GROUP BY 
    country
ORDER BY 
    average_revenue DESC;

-- Question  7 Products Bought Together
SELECT 
    a.stock_code AS product_1,
    b.stock_code AS product_2,
    COUNT(*) AS times_bought_together
FROM sales_data a
JOIN sales_data b
    ON a.invoice_no = b.invoice_no
    AND a.stock_code < b.stock_code
GROUP BY a.stock_code, b.stock_code
ORDER BY times_bought_together DESC
LIMIT 10;

-- Question  8 for Top Products
SELECT 
    stock_code,
    description,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY stock_code, description
ORDER BY total_revenue DESC
LIMIT 10;

-- Question  9 Product with Highest Quantity Sold
SELECT 
    stock_code,
    description,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY stock_code, description
ORDER BY total_quantity DESC
LIMIT 1;
