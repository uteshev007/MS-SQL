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

USE [pavel]
GO
CREATE USER [prokopenko] FOR LOGIN [prokopenko]
GO


create schema itstep
authorization prokopenko;
go


--drop table if exists itstep.faculty;
go
create table itstep.faculty(
id_faculty int identity(1,1) primary key,
name_faculty varchar(100) not null unique
);
go

insert into itstep.faculty(name_faculty)
values
('Programmers'),
('Designers'),
('System administrators'),
('planner');
go

--select * from itstep.faculty

--drop table if exists itstep.teachers;
go
create table itstep.teachers(
id_teacher int identity(1,1) primary key,
firstname varchar(50) not null,
secondname varchar(50) not null,
phone varchar(15),
salary int default(5000)
);
go

insert into itstep.teachers(firstname,secondname,phone,salary)
values
('Yuriy','Vassilyev',87077244010,10000),
('Sergey','Grigoriyvich',87077244011,12000),
('Anton','Pavlovich',87077244012,5000);
go

--select * from itstep.teachers


--drop table if exists itstep.disciplines;
go
create table itstep.disciplines(
id_dis int identity(1,1) primary key,
nameof varchar(80) not null,
OneId int,
TwoId int,
ThreeId int,
);
go


insert into itstep.disciplines(nameof, OneId,TwoId,ThreeId)
values
('python',1,3,2),
('Adobe',3,1,2),
('WServer',1,2,3),
('1C',3,2,1);
go
--select * from itstep.disciplines


	--drop table if exists itstep.students;
go
create table itstep.students(
id_students int identity(1,1) primary key,
groupn varchar(20) not null,
FK_faculty int references itstep.faculty(id_faculty),
firstname varchar(50) not null,
secondname varchar(50) not null,
phone varchar(15),
);
go

--select * from itstep.students
--select * from itstep.lectures

insert into itstep.students(groupn,FK_faculty,firstname,secondname)
values
('IT4',4,'Pavel','Prokopenko'),
('IT3',3,'Taimas','Vercelo'),
('IT2',2,'Ruslan','Cheysov'),
('IT3',3,'Vladimir','Lenin'),
('IT1',1,'Holden','Kolfild');
go



	--drop table if exists itstep.lectures;
go
create table itstep.lectures(
id_lectures int identity(1,1) primary key,
topic varchar(80) not null,
FK_dis int references itstep.disciplines(id_dis),
FK_teachers int references itstep.teachers(id_teacher),
dayof date not null
);
go
--select * from itstep.lectures

insert into itstep.lectures(topic,FK_dis,FK_teachers,dayof)
values
('lec1',3,1,'2020-05-11'),
('lec2',2,3,'2020-01-21'),
('lec3',1,3,'2020-01-16'),
('lec4',2,2,'2020-04-10');
go

	--drop table if exists itstep.visits;
go
create table itstep.visits(
id_visits int identity(1,1) primary key,
FK_students int references itstep.students(id_students),
FK_lectures int references itstep.lectures(id_lectures),
control_point int,
class_point int
);
go

insert into itstep.visits(FK_lectures,FK_students)
values
(1,1),
(4,2),
(3,3),
(1,4),
(2,5);
go


-------------------------------------------------Prohodnoe zadanye






USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'backup', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'SQLSEP02\Administrator', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'backup', @server_name = N'SQLSEP02\SQLSEP02'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'backup', @step_name=N'1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @filename varchar(100) 
set @filename=''c:\backups\pavel_'' + replace (convert(varchar(19),getdate(), 105),'':'',''-'')+''.bak'' 

backup database tsql to disk = @filename;', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'backup', @step_name=N'2', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'move /y c:\backups\*.bak e:\tsqlbackup\', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'backup', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'SQLSEP02\Administrator', 
		@notify_email_operator_name=N'', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'backup', @name=N'1', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20221214, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=235959, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO
