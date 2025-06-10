CREATE EXTERNAL TABLE gold.ProductSales_External
WITH
(
    LOCATION = 'ProductSales_External',
    DATA_SOURCE = AdWorksGoldSource,
    FILE_FORMAT = ParquetFormat
) AS

SELECT se.ProductKey, pe.ProductName, sum(se.OrderQuantity) as TotalOrders FROM gold.Sales_External se 
INNER JOIN gold.Products_External pe 
ON se.ProductKey = pe.ProductKey
GROUP BY se.ProductKey, pe.ProductName
ORDER BY se.ProductKey;


SELECT * FROM gold.ProductSales_External;