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


-- ==========================================
-- ASSIGNMENT 3
-- ==========================================

-- 1. Create a stage & file format object

-- Creating File Format
CREATE OR REPLACE SCHEMA EXERCISE_DB.FILE_FORMATS;

Create or Replace file format exercise_db.file_formats.my_format;

ALTER file format exercise_db.file_formats.my_format
    Set SKIP_HEADER = 1
    Field_delimiter = '|';

DESC file format exercise_db.file_formats.my_format;

TRUNCATE table EXERCISE_DB.PUBLIC.CUSTOMERS;

-- Creating STAGE
CREATE OR REPLACE STAGE exercise_db.ex_stages.aws_stages_v3
    url='s3://snowflake-assignments-mc/fileformat/';

DESC STAGE exercise_db.ex_stages.aws_stages_v3;

-- 2. List the files in the table
List @exercise_db.ex_stages.aws_stages_v3;

-- 3. Load the data in the existing customers table using the COPY command your stage and the created file format object.

COPY into exercise_db.public.customers
    From @exercise_db.ex_stages.aws_stages_v3
    file_format = (format_name = exercise_db.file_formats.my_format)

-- 4. How many rows have been loaded in this assignment?

Select Count(*) As row_count
    from exercise_db.public.customers;
-- Total: 250

-- ==========================================
-- ASSIGNMENT 4
-- ==========================================

-- 1. Create a table called employees with the following columns and data types

create or replace table exercise_db.public.Employees (
  customer_id int,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  age int,
  department varchar(50)
)   

-- 2. Create a stage object pointing to 's3://snowflake-assignments-mc/copyoptions/example1'

create or replace stage exercise_db.ex_stages.aws_stages_v4
    url='s3://snowflake-assignments-mc/copyoptions/example1';

-- 3. Create a file format object with the specification
Create or Replace file format exercise_db.file_formats.my_format_v1;

ALTER file format exercise_db.file_formats.my_format_v1
 Set Field_delimiter = ','
     Skip_header = 1;

-- 4. Use the copy option to only validate if there are errors
COPY INTO exercise_db.public.employees
    FROM @exercise_db.ex_stages.aws_stages_v4
    file_format = (format_name = exercise_db.file_formats.my_format_v1)
    VALIDATION_MODE = RETURN_ERRORS;

-- 5. Load the data anyways regardless of the error using the ON_ERROR option
COPY INTO exercise_db.public.employees
    FROM @exercise_db.ex_stages.aws_stages_v4
    file_format = (format_name = exercise_db.file_formats.my_format_v1)
    ON_ERROR = CONTINUE;

SELECT COUNT(*) AS rows_loaded FROM exercise_db.public.employees;
-- Total: 121


-- ==========================================
-- ASSIGNMENT 5
-- ==========================================

-- 1. Create a table called employees
CREATE OR REPLACE TABLE EXERCISE_DB.PUBLIC.EMPLOYEES (
  customer_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  age INT,
  department VARCHAR(50)
);

-- 2. Create a stage object pointing to s3://snowflake-assignments-mc/copyoptions/example2
CREATE OR REPLACE STAGE EXERCISE_DB.EX_STAGES.AWS_STAGES_V5
    url='s3://snowflake-assignments-mc/copyoptions/example2';

-- 3. Create a file format object
CREATE OR REPLACE FILE FORMAT EXERCISE_DB.FILE_FORMATS.MY_FORMAT_V2
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1;

-- 4. Use COPY with VALIDATION_MODE to check for errors
COPY INTO EXERCISE_DB.PUBLIC.EMPLOYEES
    FROM @EXERCISE_DB.EX_STAGES.AWS_STAGES_V5
    file_format = (format_name = EXERCISE_DB.FILE_FORMATS.MY_FORMAT_V2)
    VALIDATION_MODE = RETURN_ERRORS;

-- 5. Load data using TRUNCATECOLUMNS to handle values exceeding column length
COPY INTO EXERCISE_DB.PUBLIC.EMPLOYEES
    FROM @EXERCISE_DB.EX_STAGES.AWS_STAGES_V5
    file_format = (format_name = EXERCISE_DB.FILE_FORMATS.MY_FORMAT_V2)
    TRUNCATECOLUMNS = TRUE;

select count(*) as total_number from EXERCISE_DB.PUBLIC.EMPLOYEES;
-- 62