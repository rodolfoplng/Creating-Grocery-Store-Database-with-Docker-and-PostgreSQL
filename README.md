# Creating Grocery Store Database with Docker and PostgreSQL  

A reproducible, containerized PostgreSQL environment for a grocery/retail analytics scenario.  
It ships a clean schema, seed data, and example queries so anyone can spin it up and explore.  

## Why this project?  

- **Portfolio-ready**: clear schema + seed + example insights.
- **Reproducible**: one command to bring everything up.
- **Extensible**: add ETL scripts, BI dashboards, or dbt models later.  

## Stack  

- Docker & Docker Compose
- PostgreSQL 16
- (Optional) pgAdmin 4  

## Project files & folders  

.  
├─ init/  
│ ├─ 01_schema.sql  
│ ├─ 02_constraints.sql  
│ ├─ 03_indexes.sql  
│ └─ 04_load_data.sql  
├─ scripts/  
│ ├─ exploration.sql  
│ ├─ sanity_checks.sql  
│ └─ (other helper queries)  
├─ screenshots/  
│ ├─ erd.png  
│ └─ (other visuals)  
└─ docker-compose.yml  


### What each init script does (executed alphabetically on first boot)  
  
**01_schema.sql**
Creates the database schema and base tables (no foreign keys yet).  
- Connects to the target DB (e.g., `\connect grocery;`)  
- Creates schema `raw`  
- Defines tables such as `raw.categories`, `raw.countries`, `raw.cities`, `raw.customers`, `raw.employees`, `raw.products`, `raw.sales` with proper data types  
  
**02_constraints.sql**
Adds relational integrity after the tables exist.  
- Foreign keys (e.g., `raw.sales.ProductID → raw.products.ProductID`)  
- Optional unique constraints and check constraints (if any)  
- Keeping constraints here (separate from schema creation) makes initial bulk loads simpler and faster  
  
**03_indexes.sql**
Adds performance indexes used by typical analytics queries.  
- Example: indexes on `SalesDate`, `CustomerID`, `ProductID`, `SalesPersonID`  
- Indexes are created **after** the initial load to speed up ingestion and keep startup simple  
  
**04_load_data.sql**
Bulk-loads CSVs into the tables using `\COPY`.  
- Uses the mounted `/data/*.csv` files  
- This repository includes **sample** `\COPY` commands and **sample-sized CSVs** to keep the repo light  
- **Full dataset** lives on Kaggle:  
  **Grocery Sales Dataset** → [https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset/data)  
  (Download the full CSVs and place them under `./data/` if you want to load everything.)  
  
> Note: The `init/` scripts run automatically only on the **first** container start (when the data volume is empty).  
> If you change any file later and want to re-run, either execute scripts manually via `psql`, or reset the volume:
> ```
> docker compose down -v
> docker compose up -d
> ```


### Other folders  

**scripts/**  
A small set of ready-to-run SQL queries for exploration and validation:
- `exploration.sql`: example joins (top products by revenue, monthly trends, customers by country/city)
- `sanity_checks.sql`: row counts by table, orphan checks before/after constraints, etc.  

**screenshots/**  
Visual documentation of the project:
- `ERD.png` – entity-relationship diagram of the database
- Any other charts or UI screenshots you want to showcase in your portfolio  


## Quickstart  

```bash
# 1) Clone and enter
git clone https://github.com/<your-user>/Creating-Grocery-Store-Database-with-Docker-and-PostgreSQL.git
cd Creating-Grocery-Store-Database-with-Docker-and-PostgreSQL

# 2) Create your .env from the template
cp .env.example .env
# (Edit passwords/ports if you want)

# 3) Run containers (first run will initialize schema + seed data)
docker compose up -d

# 4) Connect:
docker exec -it pg_grocery_db psql -U pguser -d grocery # - psql
# - pgAdmin (optional): http://localhost:5050  (use credentials from .env)
```

-- list tables in the raw schema  
\dt raw.*;

-- quick test query  
SELECT COUNT(*) FROM raw.sales;
  
For more projects, check out my [Portfolio Repository](https://github.com/rodolfoplng/Portfolio).
