-- ==========================================
-- ASSIGNMENT 1
-- ==========================================

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


-- ==========================================
-- ASSIGNMENT 2
-- ==========================================

-- 1. Create a database called EXERCISE_DB
CREATE OR REPLACE DATABASE EXERCISE_DB;

-- 2. Create a stage object
CREATE OR REPLACE SCHEMA ex_stages;

-- Creating external stage
CREATE OR REPLACE STAGE exercise_db.ex_stages.aws_stages
    url='s3://snowflake-assignments-mc/loadingdata'

 -- Description of external stage

 DESC STAGE exercise_db.ex_stages.aws_stages;

 -- 3. List the files in the table

 LIST @aws_stages;

 -- 4. Load the data in the existing customers table using the COPY command

 CREATE OR REPLACE TABLE exercise_db.public.Customers (
    ID INT,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    age INT,
    city VARCHAR
 )

 COPY INTO exercise_db.public.customers
    FROM @aws_stages
    file_format = (type = csv field_delimiter =';', skip_header = 1)

 SELECT COUNT(*) as Row_Count 
    FROM exercise_db.public.CUSTOMERS