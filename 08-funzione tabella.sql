
CREATE or alter FUNCTION fn_TabProdotti 
(	
	@makeFlag bit = NULL
)
RETURNS TABLE 
AS
RETURN 
(
	select *
	from [Production].[Product]
	where MakeFlag = ISNULL(@makeFlag, MakeFlag)
)
GO
