-- dml: manipolazione dei dati
-- insert, update, delete, select

-- ddl: query di definizione della struttura del DB
-- create, alter, drop
-- create or alter view vw_prodotti_per_stock
create or alter procedure sp_prodotti_per_stock
(
	@makeFlag bit = NULL -- specifico il valore di default dell'argomento (diventa opzionale)
)
as

declare @testo varchar(50)

set @testo = 'ciao'

print @testo

SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[MakeFlag]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[SizeUnitMeasureCode]
      ,WeightUnitMeasureCode
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[Class]
      ,[Style]
      ,[ProductSubcategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,[rowguid]
      ,[ModifiedDate]
from (
select 
	ROW_NUMBER() OVER (order by ProductID) num,
	RANK() OVER (partition by SafetyStockLevel order by Name) rank,
	*
from [Production].[Product]
) q
where rank = 1
and MakeFlag = ISNULL(@makeFlag, MakeFlag)