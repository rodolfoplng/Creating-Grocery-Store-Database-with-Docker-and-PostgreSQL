\connect grocery;

CREATE SCHEMA IF NOT EXISTS raw;

-- 1. categories
CREATE TABLE IF NOT EXISTS raw.categories (
    CategoryID      integer PRIMARY KEY,
    CategoryName    varchar(45) NOT NULL
);

-- 2. countries
CREATE TABLE IF NOT EXISTS raw.countries (
    CountryID       integer PRIMARY KEY,
    CountryName     varchar(45) NOT NULL,
    CountryCode     varchar(2)  NOT NULL
);

-- 3. cities
CREATE TABLE IF NOT EXISTS raw.cities (
    CityID          integer PRIMARY KEY,
    CityName        varchar(45) NOT NULL,
    Zipcode         numeric(5,0),
    CountryID       integer      NOT NULL
    -- FK depois
);

-- 4. customers
CREATE TABLE IF NOT EXISTS raw.customers (
    CustomerID      integer PRIMARY KEY,
    FirstName       varchar(45),
    MiddleInitial   varchar(1),
    LastName        varchar(45),
    CityID          integer      NOT NULL,
    Address         varchar(90)
    -- FK depois
);

-- 5. employees
CREATE TABLE IF NOT EXISTS raw.employees (
    EmployeeID      integer PRIMARY KEY,
    FirstName       varchar(45),
    MiddleInitial   varchar(1),
    LastName        varchar(45),
    BirthDate       date,
    Gender          varchar(10),
    CityID          integer,
    HireDate        date
    -- FK depois
);

-- 6. products
CREATE TABLE IF NOT EXISTS raw.products (
    ProductID       integer PRIMARY KEY,
    ProductName     varchar(45) NOT NULL,
    Price           numeric(4,2) NOT NULL,
    CategoryID      integer      NOT NULL,
    Class           varchar(15),
    ModifyDate      date,
    Resistant       varchar(15),
    IsAllergic      varchar(10),
    VitalityDays    numeric(3,0)
    -- FK depois
);

-- 7. sales
CREATE TABLE IF NOT EXISTS raw.sales (
    SalesID             integer PRIMARY KEY,
    SalesPersonID       integer      NOT NULL,
    CustomerID          integer      NOT NULL,
    ProductID           integer      NOT NULL,
    Quantity            integer      NOT NULL,
    Discount            numeric(10,2),
    TotalPrice          numeric(10,2) NOT NULL,
    SalesDate           timestamp    NOT NULL,
    TransactionNumber   varchar(25)  NOT NULL
    -- FKs depois
);
