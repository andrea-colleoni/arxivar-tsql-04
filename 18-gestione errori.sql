-- gestione degli errori

begin try -- inizio della parte di codice che potrebbe andare in errore
	INSERT INTO [Production].[Product]
           ([Name] ,[ProductNumber] ,[SafetyStockLevel] ,[ReorderPoint] ,[StandardCost] ,[ListPrice] ,[DaysToManufacture] ,[SellStartDate])
    VALUES
           ('Test 03'  ,'AB-12347' ,100 ,10 ,10.5 ,5.5 ,1  ,'2021-2-18')
end try
begin catch
	select ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(),
	ERROR_PROCEDURE(), ERROR_LINE(), ERROR_MESSAGE()

	if ERROR_NUMBER() = 2601
	begin
		print 'dovrei fare un update...'
	end
end catch

select *
from [Production].[Product]