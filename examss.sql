USE [master]
GO
CREATE LOGIN [prokopenko] WITH PASSWORD=N'Pa55w.rd' MUST_CHANGE, DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [prokopenko]
GO

create database pavel;
go
use pavel;
go


create schema itstep
authorization prokopenko;
go
