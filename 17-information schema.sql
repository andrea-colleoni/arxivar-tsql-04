declare @tabella nvarchar(100),
		@schema nvarchar(100),
		@sql nvarchar(max)

declare tabelle cursor for
select 
	TABLE_SCHEMA,
	TABLE_NAME
from INFORMATION_SCHEMA.TABLES

open tabelle
fetch next from tabelle
into @schema, @tabella

while(@@FETCH_STATUS = 0)
begin
	set @sql = 'select top 1 * from ' + @schema + '.' + @tabella

	execute sp_executesql @sql


	fetch next from tabelle
	into @schema, @tabella
end

close tabelle
deallocate tabelle