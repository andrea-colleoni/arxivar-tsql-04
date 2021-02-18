declare 
	@data datetime,
	@testo varchar(100),
	@importo money

-- Utilizzare ISO 8601
set @data = '2021-02-28T23:00:00'
print @data

set @testo = 'testo...
sdkfjlksfjlks
sdfsdfsdfsdfsd.'

print @testo

set @importo = 12345.25
print @importo

print 'ciao' + '*' + 'buongiorno' -- + funziona come concatenazione

-- print 'l''importo è ' + @importo -- + funziona da somma algebrica!!

print 'l''importo è ' + CAST(@importo as varchar) -- CAST converte il tipo, se possibile
print CONCAT('l''importo è ', @importo) -- CONCAT concatenza stringhe