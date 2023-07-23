USE master
GO

-- Drop and restore Databases
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name = 'TSQL')
BEGIN
	DROP DATABASE TSQL
END
GO



RESTORE DATABASE [TSQL] FROM  DISK = N'D:\SetupFiles\TSQL.bak' WITH  REPLACE,
MOVE N'TSQL' TO N'D:\SetupFiles\TSQL.mdf', 
MOVE N'TSQL_Log' TO N'D:\SetupFiles\TSQL_log.ldf'
GO
ALTER AUTHORIZATION ON DATABASE::TSQL TO [MSSQL\Administrator];
GO

