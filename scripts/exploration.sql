-- ========================
-- Exploration queries
-- ========================

-- Top 10 products by revenue
-- NOTE: the column totalprice in sales is not populated (all zeros).
-- Therefore, we calculate revenue as sales.quantity * products.price.
SELECT p.productname,
       SUM(s.quantity * p.price) AS revenue
FROM sales s
JOIN products p ON p.productid = s.productid
GROUP BY p.productname
ORDER BY revenue DESC
LIMIT 10;

-- Monthly sales trend
-- Using TO_CHAR(DATE_TRUNC(...), 'YYYY-MM') to display months in a readable format
SELECT TO_CHAR(DATE_TRUNC('month', s.salesdate), 'YYYY-MM') AS month,
       SUM(s.quantity * p.price) AS revenue
FROM sales s
JOIN products p ON p.productid = s.productid
GROUP BY 1
ORDER BY 1;

-- Customers per country and city
SELECT co.countryname,
       ci.cityname,
       COUNT(DISTINCT cu.customerid) AS customers
FROM customers cu
JOIN cities ci ON ci.cityid = cu.cityid
JOIN countries co ON co.countryid = ci.countryid
GROUP BY 1,2
ORDER BY 1,2;

-- Employee sales performance
-- Revenue also recalculated via quantity * price
SELECT e.firstname || ' ' || e.lastname AS employee,
       SUM(s.quantity * p.price) AS revenue,
       COUNT(*) AS num_sales
FROM sales s
JOIN employees e ON e.employeeid = s.salespersonid
JOIN products p ON p.productid = s.productid
GROUP BY employee
ORDER BY revenue DESC
LIMIT 10;
