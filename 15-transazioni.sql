-- la transazione

declare @nome nvarchar(50)

begin transaction

select top 1
	@nome = Name
from [Production].[Product] p
order by ProductID desc

update [Production].[Product] set Name = 'Ultimo prodotto' where Name = @nome

rollback transaction
commit transaction

-- query che attende l'esito della tx
