ALTER TABLE raw.cities
  ADD CONSTRAINT fk_cities_country
  FOREIGN KEY (CountryID) REFERENCES raw.countries(CountryID);

ALTER TABLE raw.customers
  ADD CONSTRAINT fk_customers_city
  FOREIGN KEY (CityID) REFERENCES raw.cities(CityID);

ALTER TABLE raw.employees
  ADD CONSTRAINT fk_employees_city
  FOREIGN KEY (CityID) REFERENCES raw.cities(CityID);

ALTER TABLE raw.products
  ADD CONSTRAINT fk_products_category
  FOREIGN KEY (CategoryID) REFERENCES raw.categories(CategoryID);

ALTER TABLE raw.sales
  ADD CONSTRAINT fk_sales_employee
  FOREIGN KEY (SalesPersonID) REFERENCES raw.employees(EmployeeID);

ALTER TABLE raw.sales
  ADD CONSTRAINT fk_sales_customer
  FOREIGN KEY (CustomerID) REFERENCES raw.customers(CustomerID);

ALTER TABLE raw.sales
  ADD CONSTRAINT fk_sales_product
  FOREIGN KEY (ProductID) REFERENCES raw.products(ProductID);
