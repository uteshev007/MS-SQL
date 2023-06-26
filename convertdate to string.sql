backup database tsql to disk = 'c:\backups\tsql.bak' --with format;
/*
BACKUP DATABASE [AdventureWorks] TO  DISK = 
N'c:\Demofiles\Mod08\Backups\AdventureWorksAgentBackup.bak' WITH NOFORMAT, INIT,  
NAME = N'AdventureWorks-Full Database Backup', COMPRESSION,  STATS = 10 
GO 
*/

declare @filename varchar(100)
set @filename='D:\old_backup\tsql_' + replace (convert(varchar(19),getdate(), 120),':','-')+'.bak'
select @filename='  