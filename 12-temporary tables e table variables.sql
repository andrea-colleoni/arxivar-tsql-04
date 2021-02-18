-- temporary tables
-- variabili di tipo tabella
-- confronto tra queste

-- il # davanti al nome fa creare la tabella in tempdb (tabella temporanea)
--create table ##totali_ordini (
declare @tempTab table (
	id_ordine int,
	totale money
)

--insert into ##totali_ordini
insert into @tempTab
select 
	sh.SalesOrderID,
	SUM([OrderQty] * [UnitPrice])
from 
	[Sales].[SalesOrderHeader] sh inner join [Sales].[SalesOrderDetail] sd
	on sh.SalesOrderID = sd.SalesOrderID
group by
	sh.SalesOrderID

declare @mediaOrdini money
--select @mediaOrdini = AVG(totale) from  ##totali_ordini
select @mediaOrdini = AVG(totale) from  @tempTab

select 
	id_ordine,
	totale,
	@mediaOrdini,
	totale - @mediaOrdini
from
	--##totali_ordini
	@tempTab
order by 4 desc

--drop table #totali_ordini

