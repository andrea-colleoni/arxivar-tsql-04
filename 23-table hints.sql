-- query che attende l'esito della tx
select *
from [Production].[Product] with (READUNCOMMITTED)