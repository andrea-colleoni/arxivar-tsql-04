/*
commento su più righe
*/

-- dichiarazione di variabili

declare @variabile int

-- set @variabile = 'ciao'
set @variabile = 10
print @variabile

set @variabile = '20' -- viene eseguito un CAST automatico
print @variabile

select @variabile = 2
print @variabile

select *
from persone
where id > @variabile

select 1, 2, 3, nome
from persone

select @variabile = 15
from persone

print @variabile

select @variabile = id
from persone

print @variabile