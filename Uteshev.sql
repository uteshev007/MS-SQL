create database Uteshev;
go

use Uteshev;
go


create schema policlinic
authorization dbo;
go

drop table if exists policlinic.Departments;
go

create table policlinic.Departments (
id_dep int identity(1,1) primary key,
building int not null check(building>=1 and building <=5),
name_otdel varchar(100) not null unique
);
go


insert into policlinic.Departments (building, name_otdel)
values
		(1,'Filtr'),
		(2,'Pediatria'),
		(3,'Travmatologiya'),
		(4,'Ginekologiya');
		go

select * from policlinic.Departments

drop table if exists policlinic.surveys;
go

create table policlinic.surveys (
id_sur int identity(1,1) primary key,
name_surveys varchar(100) not null unique,
id_dep int references policlinic.Departments(id_dep)
);
go

insert into policlinic.surveys ( id_dep, name_surveys)
values
		(1, 'COVID-19'),
		(2,'Koliki'),
		(3,'Perelom'),
		(4,'Beremennost');
		go

select * from policlinic.surveys

drop table if exists policlinic.Specialization;
go

create table policlinic.specialization (
id_spe int identity(1,1) primary key,
specialization varchar(80) not null
);
go

insert into policlinic.Specialization (specialization)
values
('Terapeft'),
('Pediatr'),
('Hirurg'),
('Ginekolog');
go

drop table if exists policlinic.Diseases;
go

create table policlinic.Diseases (
id_dis int identity(1,1) ,
nameof varchar(100) not null unique,
difficult int  check(difficult>=1) default(1),
primary key (id_dis,difficult)
);
go

insert into policlinic.diseases (nameof)
values
		('Temperatura'),
		('Nasmork'),
		('Gnoi'),
		('Tsistit');
		go


drop table if exists policlinic.doctors;
go
create table policlinic.doctors (
id_doc int identity(1,1) primary key,
FK_dep int references policlinic.departments(id_dep),
FK_spe int references policlinic.specialization(id_spe),
Firstname varchar(50) not null,
Secondname varchar(50) not null,
phone varchar(15),
salary money not null check(salary>=0)
);
go
insert into policlinic.doctors (fk_dep,fk_spe,Firstname,Secondname,salary)
values
		(1,1,'Aibolit','Doctorov', 350000),
		(2,2, 'KasymJomart', 'Tokayev', 400000),
		(3,3, 'Ivan','Pastukhov', 450000),
		(4,4, 'Tatyana', 'Petrova', 400000);
		go

drop table if exists policlinic.examinations;
go
create table policlinic.examinations (
id_exa int identity(1,1) primary key,
IIN varchar(12) not null,
dayof date not null,
timeof varchar(10) not null,
FK_sur int references policlinic.surveys(id_sur),
FK_doc int references policlinic.doctors(id_doc),
Summary varchar(250) not null
);
go

insert into policlinic.examinations(IIN,dayof,timeof,FK_sur,FK_doc,Summary)
values
		('123456789101', '01/10/2015','09:20',1,4,'120000'),
		('963245684542', '04/20/2000','15:50',2,3,'300000'),
		('935448545745', '07/13/2011','18:33',3,1,'122000'),
		('987493827411', '02/07/2022','10:42',4,2,'250000');
		go
		select * from policlinic.examinations

select * from policlinic.Departments, policlinic.Diseases, policlinic.doctors, 
policlinic.examinations, policlinic.specialization, policlinic.surveys;