BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\adventureworks.bak' 
WITH 
	NOFORMAT, 
	INIT,  
	NAME = N'AdventureWorks2019-Full Database Backup', 
	SKIP, 
	NOREWIND, NOUNLOAD,  STATS = 10
GO

BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\adventureworks.bak' 
WITH  
	DIFFERENTIAL , 
	NOFORMAT, 
	NOINIT,  
	NAME = N'AdventureWorks2019-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

BACKUP LOG [AdventureWorks2019] 
TO  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\adventureworks.bak' 

USE [master]
BACKUP LOG [AdventureWorks2019] 
TO  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\AdventureWorks2019_LogBackup_2021-02-19_14-29-08.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2019_LogBackup_2021-02-19_14-29-08', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5

RESTORE DATABASE [AdventureWorks2019] 
FROM  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\adventureworks.bak' 
WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  STATS = 5

RESTORE LOG [AdventureWorks2019] 
FROM  DISK = N'C:\RDMBSData\SQLDEV2019\Backup\adventureworks.bak' 
WITH  FILE = 2,  NOUNLOAD,  STATS = 5

GO

