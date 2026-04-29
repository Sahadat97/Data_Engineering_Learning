-- Ensuring usage of System Admin Role
USE ROLE SYSADMIN;

-- Creating a testing Warehouse
CREATE WAREHOUSE EXERCISE_WH
WAREHOUSE_SIZE = XSMALL
AUTO_SUSPEND = 600  -- automatically suspend the virtual warehouse after 10 minutes of not being used
AUTO_RESUME = TRUE 
COMMENT = 'This is a virtual warehouse of size X-SMALL that can be used to process queries.';

ALTER WAREHOUSE COMPUTE_WH RESUME


-- Rename data base & creating the table + meta data

ALTER DATABASE FIRST_DB RENAME TO OUR_FIRST_DB

-- Creating the table / Meta data

CREATE TABLE "OUR_FIRST_DB"."PUBLIC"."LOAN_PAYMENT" (
  "Loan_ID" STRING,
  "loan_status" STRING,
  "Principal" STRING,
  "terms" STRING,
  "effective_date" STRING,
  "due_date" STRING,
  "paid_off_time" STRING,
  "past_due_days" STRING,
  "age" STRING,
  "education" STRING,
  "Gender" STRING);
  
  
 //Check that table is empy
 USE DATABASE OUR_FIRST_DB;

 SELECT * FROM LOAN_PAYMENT;

 
 //Loading the data from S3 bucket
  
 COPY INTO LOAN_PAYMENT
    FROM s3://bucketsnowflakes3/Loan_payments_data.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1);
    

//Validate
 SELECT * FROM LOAN_PAYMENT;

CREATE DATABASE EXERCISE_DB;