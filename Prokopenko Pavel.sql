
use Prokopenko;
go

--drop schema if exists Pavel;

create schema Pavel
authorization dbo;
go

drop table if exists Pavel.Departments;
go
create table Pavel.Departments (
id_dep int identity(1,1) primary key,
building int not null check(building>=1 and building <=5),
name_otdel varchar(100) not null unique
);
go

insert into Pavel.Departments (building,name_otdel)
values
		(1,'Hirurgiya'),
		(1,'Fizio'),
		(2,'Travmatologiya'),
		(3,'Pediatriya');
		go

select * from Pavel.Departments

drop table if exists Pavel.surveys;
go
create table Pavel.surveys (
id_sur int identity(1,1) primary key,
name_surveys varchar(100) not null unique,
FK_dep int references Pavel.Departments(id_dep)
);
go

insert into Pavel.surveys ( fk_dep, name_surveys)
values
		(1, 'Ploskostopie'),
		(1,'Perelom nogi'),
		(3,'Perelom Chelusti'),
		(4,'Bronhit');
		go
select * from Pavel.surveys
select * from Pavel.Doctors

drop table if exists Pavel.Specialization;
go
create table Pavel.specialization (
id_spe int identity(1,1) primary key,
specialization varchar(80) not null
);
go
insert into Pavel.Specialization (specialization)
values
('Otolaringolog'),
('Hirurg main practic'),
('Fizioterapevt'),
('Pediatr');
go

drop table if exists Pavel.Diseases;
go
create table Pavel.Diseases (
id_dis int identity(1,1) ,
nameof varchar(100) not null unique,
difficult int  check(difficult>=1) default(1),
primary key (id_dis,difficult)
);
go
insert into Pavel.diseases (nameof)
values
		('Bronhit'),
		('Rinit'),
		('Astma'),
		('Angina');
		go


drop table if exists Pavel.doctors;
go
create table Pavel.doctors (
id_doc int identity(1,1) primary key,
FK_dep int references Pavel.departments(id_dep),
FK_spe int references Pavel.specialization(id_spe),
Firstname varchar(50) not null,
Secondname varchar(50) not null,
phone varchar(15),
salary money not null check(salary>=0)
);
go
insert into Pavel.doctors (fk_dep,fk_spe,Firstname,Secondname,salary)
values
		(2, 1,'Kamil','Mursalimbaev', 350000),
		(1,2, 'Alisher', 'Jeksembinov', 400000),
		(3,3, 'Azamat','Sovet', 450000),
		(4,4, 'Daniil', 'Kim', 400000);
		go

drop table if exists Pavel.examinations;
go
create table Pavel.examinations (
id_exa int identity(1,1) primary key,
IIN varchar(12) not null,
dayof date not null,
timeof varchar(10) not null,
FK_sur int references Pavel.surveys(id_sur),
FK_doc int references Pavel.doctors(id_doc),
Summary varchar(250) not null
);
go


insert into Pavel.examinations(IIN,dayof,timeof,FK_sur,FK_doc,Summary)
values
		('642467525673', '01/10/2015','09:20',1,4,'120000'),
		('124123515266', '04/20/2000','15:50',2,3,'300000'),
		('315152512546', '07/13/2011','18:33',3,1,'122000'),
		('987493827411', '02/07/2022','10:42',4,2,'250000');
		go
		select * from Pavel.examinations



