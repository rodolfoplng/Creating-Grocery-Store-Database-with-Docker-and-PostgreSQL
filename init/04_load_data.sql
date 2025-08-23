\COPY raw.categories (CategoryID, CategoryName) FROM '/data/categories.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.countries  (CountryID, CountryName, CountryCode) FROM '/data/countries.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.cities     (CityID, CityName, Zipcode, CountryID) FROM '/data/cities.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.customers  (CustomerID, FirstName, MiddleInitial, LastName, CityID, Address) FROM '/data/customers.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.employees  (EmployeeID, FirstName, MiddleInitial, LastName, BirthDate, Gender, CityID, HireDate) FROM '/data/employees.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.products   (ProductID, ProductName, Price, CategoryID, Class, ModifyDate, Resistant, IsAllergic, VitalityDays) FROM '/data/products.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');
\COPY raw.sales      (SalesID, SalesPersonID, CustomerID, ProductID, Quantity, Discount, TotalPrice, SalesDate, TransactionNumber) FROM '/data/sales.csv' WITH (FORMAT csv, HEADER true, NULL 'NULL');



