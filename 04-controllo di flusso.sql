-- programmazione

declare @numero int

set @numero = RAND() * 10

if @numero > 5
begin
	print 'il numero è maggiore di 5'

	select *
	from persone 
	where id % 2 = 0
end
else
begin
	print 'il numero NON è maggiore di 5'

	select *
	from persone 
	where id % 2 = 1
end
