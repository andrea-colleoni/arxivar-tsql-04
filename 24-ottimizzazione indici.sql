SELECT soh.AccountNumber,
 sod.LineTotal,
 sod.OrderQty,
 sod.UnitPrice,
 p.Name
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod
 ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product p
 ON sod.ProductID = p.ProductID
WHERE sod.LineTotal > 20000;

CREATE NONCLUSTERED INDEX IX_Suggerito
ON [Sales].[SalesOrderDetail] ([LineTotal])
INCLUDE ([OrderQty],[ProductID],[UnitPrice])

drop index IX_Suggerito