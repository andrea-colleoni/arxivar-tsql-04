-- funzioni scalari

-- date

select *, YEAR(data_nascita), MONTH(data_nascita), DATEPART(weekday, data_nascita)
from persone
-- where data_nascita >= '1980-01-01' and data_nascita <= '1985-12-31'
-- where data_nascita between '1980-01-01' and '1985-12-31'
where YEAR(data_nascita) between 1980 and 1985

print GETDATE()
print DATEADD(day, 30, GETDATE())
print DATEADD(month, 1, GETDATE())
print DATEADD(day, -30, GETDATE())

print DATEDIFF(hour, '1980-05-05', GETDATE())

print EOMONTH(GETDATE())

-- stringhe

print TRIM('   abcde   rfgh   ')
print LTRIM('   abcde   rfgh   ')
print RTRIM('   abcde    rfgh   ')
print UPPER('abCdEfGhI')
print LOWER('abCdEfGhI')

select *
from persone
where TRIM(nome) = TRIM(' mario ')

select *
from persone
where LOWER(TRIM(nome)) = LOWER(TRIM(' mario '))

select *
from persone
where cognome collate Latin1_General_CS_AS = 'bilà' collate Latin1_General_CS_AS

print REPLICATE('*', 10)

select *
from persone
where nome LIKE 'M%'

select *
from persone
where LEFT(nome, 1) = 'M'

select *
from persone
where CHARINDEX('M', nome) = 1