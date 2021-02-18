CREATE OR ALTER FUNCTION fn_Prefisso 
(
	@testo varchar(max)
)
RETURNS varchar(3)
AS
BEGIN
	declare @variabile int

	---print 'ciao'

	RETURN LEFT(@testo, 3)
END
GO

