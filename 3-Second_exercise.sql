use schema OUR_FIRST_DB.PUBLIC;

create or replace table CUSTOMERS(
    ID int,
    first_name varchar,
    last_name varchar,
    email varchar,
    age int,
    city varchar
);

COPY INTO CUSTOMERS
    FROM 's3://snowflake-assignments-mc/gettingstarted/customers.csv'
    file_format = (type = csv
                   field_delimiter = ','
                   skip_header = 1);
