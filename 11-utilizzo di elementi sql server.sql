-- "lettura" di dati da una vista
SELECT TOP (1000) *
  FROM [vw_prodotti_per_stock]
  where MakeFlag = 0

-- "esecuzione" di una procedure (è un programma)
-- può restituire dati, ma questi saranno difficili da interrogare in SQL
exec [sp_prodotti_per_stock] @makeFlag=1

-- "utilizzo" di una funzione scalare (in select, where, order by,...)
select dbo.fn_Prefisso(Name)
from [Production].[Product]

-- "interrogazione" di una funzione tabella (in from), la quale 
-- è anche programmabile, può eseguire operazioni, accettare variabili, ecc.
select *
from dbo.fn_TabProdotti(NULL) -- inner join ....
where ProductNumber LIKE 'BE%'

