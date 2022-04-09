// Transforming using the SELECT statement

COPY INTO MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX
    FROM (select s.$1, s.$2 from @MANAGE_DB.external_stages.aws_stage s)
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files=('OrderDetails.csv');



// Example 1 - Table

CREATE OR REPLACE TABLE MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT
    );
   
   
SELECT * FROM MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX;
   
// Example 2 - Table    

CREATE OR REPLACE TABLE MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    PROFITABLE_FLAG VARCHAR(30)
    );


// Example 2 - Copy Command using a SQL function (subset of functions available)

COPY INTO MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX
    FROM (select 
            s.$1,
            s.$2, 
            s.$3,
            CASE WHEN CAST(s.$3 as int) < 0 THEN 'not profitable' ELSE 'profitable' END 
          from @MANAGE_DB.external_stages.aws_stage s)
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files=('OrderDetails.csv');


SELECT * FROM MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX;


// Example 3 - Table

CREATE OR REPLACE TABLE MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    CATEGORY_SUBSTRING VARCHAR(5)
    );


// Example 3 - Copy Command using a SQL function (subset of functions available)

COPY INTO MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX
    FROM (select 
            s.$1,
            s.$2, 
            s.$3,
            substring(s.$5,1,5) 
          from @MANAGE_DB.external_stages.aws_stage s)
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files=('OrderDetails.csv');


SELECT * FROM MANAGE_DB.EXTERNAL_STAGES.ORDERS_EX;




