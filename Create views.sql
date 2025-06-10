CREATE VIEW gold.calendar
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Calendar/',
            FORMAT = 'PARQUET'
        ) as cal

CREATE VIEW gold.customers
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Customers/',
            FORMAT = 'PARQUET'
        ) as cus


CREATE VIEW gold.products
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Products/',
            FORMAT = 'PARQUET'
        ) as QUER1


------------------------
-- CREATE VIEW RETURNS
------------------------
CREATE VIEW gold.returns
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Returns/',
            FORMAT = 'PARQUET'
        ) as QUER1
        


SELECT * from gold.returns
    ------------------------
-- CREATE VIEW SALES
------------------------
CREATE VIEW gold.sales
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Sales/',
            FORMAT = 'PARQUET'
        ) as QUER1


------------------------
-- CREATE VIEW SUBCAT
------------------------
CREATE VIEW gold.subcat
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_SubCategories/',
            FORMAT = 'PARQUET'
        ) as QUER1



CREATE VIEW gold.territories
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as QUER1
SELECT * from gold.sales;
SELECT * FROM gold.territories;