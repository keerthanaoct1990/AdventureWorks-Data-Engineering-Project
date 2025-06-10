
DROP EXTERNAL TABLE dbo.Sales_External;
DROP EXTERNAL DATA SOURCE AdventureWorksdataSource;
CREATE SCHEMA gold;


CREATE MASTER KEY ENCRYPTION BY PASSWORD = '********';

CREATE DATABASE SCOPED CREDENTIAL AdworksManagedIdentity
WITH IDENTITY = 'Managed Identity';


CREATE EXTERNAL DATA SOURCE AdWorksSilverSource
WITH
(
    LOCATION = 'https://stetlproject100.dfs.core.windows.net/adventureworks-silver',
    CREDENTIAL = AdworksManagedIdentity
);


CREATE EXTERNAL FILE FORMAT ParquetFormat
WITH (
    FORMAT_TYPE = PARQUET
);

CREATE EXTERNAL TABLE gold.Sales_External
WITH
(
    LOCATION = 'Sales_External',
    DATA_SOURCE = AdWorksGoldSource,
    FILE_FORMAT = ParquetFormat
)AS
SELECT * FROM gold.sales;


CREATE EXTERNAL DATA SOURCE AdWorksGoldSource
WITH
(
    LOCATION = 'https://stetlproject100.dfs.core.windows.net/adventureworks-gold',
    CREDENTIAL = AdworksManagedIdentity
);




CREATE EXTERNAL TABLE gold.Products_External
WITH
(
    LOCATION = 'Products_External',
    DATA_SOURCE = AdWorksGoldSource,
    FILE_FORMAT = ParquetFormat
)AS
SELECT * FROM gold.products;

CREATE EXTERNAL TABLE gold.Territories_External
WITH
(
    LOCATION = 'Territories_External',
    DATA_SOURCE = AdWorksGoldSource,
    FILE_FORMAT = ParquetFormat
)AS
SELECT * FROM gold.territories;


SELECT * FROM gold.Sales_External;
