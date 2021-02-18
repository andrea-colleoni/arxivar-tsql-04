declare @nome varchar(50),
		@cognome varchar(50)

-- definizione di un cursore
declare cursore cursor for
select nome, cognome -- non posso utilizzare * nei cursori
from persone

-- apro il cursore
open cursore

-- mi sposto sulla prima riga (se la prima riga esiste)
fetch next from cursore
into @nome, @cognome

print @@fetch_status -- 0 indica che next ha funzionato (ho trovato un record su cui spostarmi)

while(@@FETCH_STATUS = 0)
begin
	print @nome + ' ' + @cognome

	fetch next from cursore
	into @nome, @cognome
end

close cursore
deallocate cursore