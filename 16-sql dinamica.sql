-- sql dinamico

declare @nome nvarchar(50)

select top 1
	@nome = Name
from [Production].[Product] p
order by ProductID desc

select *
from [Production].[Product] p
where Name = @nome

declare @table nvarchar(50),
		@sql nvarchar(max)

set @table = 'Production.ProductCategory'

set @sql = 'select *
from ' + @table

exec sp_executesql @sql
