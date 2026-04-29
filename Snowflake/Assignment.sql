-- 1. Create a database called EXERCISE_DB
CREATE DATABASE EXERCISE_DB

-- 2. Create a table called CUSTOMERS
CREATE TABLE "EXERCISE_DB"."PUBLIC"."CUSTOMERS"(
  "ID" INT,
  "first_name" VARCHAR,
  "last_name" VARCHAR,
  "email" VARCHAR,
  "age" INT,
  "city" VARCHAR
)

SELECT * FROM CUSTOMERS;

-- 3. Load the data in the table
COPY INTO CUSTOMERS
    FROM s3://snowflake-assignments-mc/gettingstarted/customers.csv
    file_format = (type = 'CSV'
                    field_delimiter = ','
                    skip_header = 1);

-- 4. Query from that table. How many rows are now in the table?
SELECT COUNT(*) AS ROW_COUNT FROM EXERCISE_DB.PUBLIC.CUSTOMERS