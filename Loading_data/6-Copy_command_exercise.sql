create database EXERCISE_DB;

CREATE OR REPLACE SCHEMA exercise_db.external_stages;

CREATE OR REPLACE STAGE snowflake_assignments
    url='s3://snowflake-assignments-mc/loadingdata/',
    file_format=(type=csv field_delimiter=';' skip_header=1);

LIST @snowflake_assignments;

create or replace table CUSTOMERS(
    ID INT,
    first_name varchar,
    last_name varchar,
    email varchar,
    age int,
    city varchar);

copy into CUSTOMERS
from @snowflake_assignments
files=('customers2.csv', 'customers3.csv');