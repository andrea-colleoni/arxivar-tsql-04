-- common table expression (CTE)
with tot_ordini_cte (SalesOrderID, Total)
as
(
select 
	sh.SalesOrderID,
	SUM([OrderQty] * [UnitPrice]) Total
from 
	[Sales].[SalesOrderHeader] sh inner join [Sales].[SalesOrderDetail] sd
	on sh.SalesOrderID = sd.SalesOrderID
group by
	sh.SalesOrderID
)
select 
	SalesOrderID, 
	Total, 
	(select AVG(Total) from tot_ordini_cte), 
	Total - (select AVG(Total) from tot_ordini_cte)
from tot_ordini_cte