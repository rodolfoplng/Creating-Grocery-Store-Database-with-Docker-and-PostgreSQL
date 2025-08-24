-- Row counts by table
SELECT 'categories' AS table_name, COUNT(*) AS rows FROM categories UNION ALL
SELECT 'countries', COUNT(*) FROM countries UNION ALL
SELECT 'cities', COUNT(*) FROM cities UNION ALL
SELECT 'customers', COUNT(*) FROM customers UNION ALL
SELECT 'employees', COUNT(*) FROM employees UNION ALL
SELECT 'products', COUNT(*) FROM products UNION ALL
SELECT 'sales', COUNT(*) FROM sales;

-- Check for orphaned sales (customers missing)
SELECT COUNT(*) AS orphan_customers
FROM sales s
LEFT JOIN customers c ON s.customerid = c.customerid
WHERE c.customerid IS NULL;

-- Check for orphaned sales (products missing)
SELECT COUNT(*) AS orphan_products
FROM sales s
LEFT JOIN products p ON s.productid = p.productid
WHERE p.productid IS NULL;

-- Check for orphaned sales (employees missing)
SELECT COUNT(*) AS orphan_employees
FROM sales s
LEFT JOIN employees e ON s.salespersonid = e.employeeid
WHERE e.employeeid IS NULL;
