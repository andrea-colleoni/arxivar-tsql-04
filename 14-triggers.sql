CREATE or alter TRIGGER Production.trg_Test 
   ON Production.Product
   --AFTER INSERT
   --AFTER DELETE
   AFTER UPDATE
AS 
BEGIN
	-- nei trigger posso usare due tabelle predefinite: inserted, deleted
	declare @nomeNuovo nvarchar(50),
	@nomeVecchio nvarchar(50)
	select @nomeNuovo = Name from inserted
	select @nomeVecchio = Name from deleted
	--print 'hai inserito il prodotto' + @nome
	--print 'hai eliminato il prodotto' + @nome
	print 'hai cambiato il nome da ' + @nomeVecchio + ' a ' + @nomeNuovo
END
GO

update [Production].[Product] set Name = 'Modificato' where Name = 'Test 03'

delete from [Production].[Product] where Name = 'Test 02'

INSERT INTO [Production].[Product]
           ([Name]
           ,[ProductNumber]
           ,[SafetyStockLevel]
           ,[ReorderPoint]
           ,[StandardCost]
           ,[ListPrice]
           ,[DaysToManufacture]
           ,[SellStartDate])
     VALUES
           ('Test 03'
           ,'AB-12347'
           ,100
           ,10
           ,10.5
           ,5.5
           ,1
           ,'2021-2-18')
GO

