CREATE INDEX IF NOT EXISTS ix_customers_city     ON raw.customers(CityID);
CREATE INDEX IF NOT EXISTS ix_employees_city     ON raw.employees(CityID);
CREATE INDEX IF NOT EXISTS ix_products_category  ON raw.products(CategoryID);

CREATE INDEX IF NOT EXISTS ix_sales_date         ON raw.sales(SalesDate);
CREATE INDEX IF NOT EXISTS ix_sales_customer     ON raw.sales(CustomerID);
CREATE INDEX IF NOT EXISTS ix_sales_employee     ON raw.sales(SalesPersonID);
CREATE INDEX IF NOT EXISTS ix_sales_product      ON raw.sales(ProductID);
