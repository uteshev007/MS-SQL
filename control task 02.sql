 create database vassilyev;
go
use vassilyev;
go
create schema yuriy
authorization dbo;
go

drop table if exists yuriy.departments;
go
create table yuriy.departments (
id_dep int identity(1,1) primary key,
building int not null check(building>=1 and building <=5),
name_otdel varchar(100) not null unique
);
go

insert into yuriy.departments (building,name_otdel)
values
		(1,'Hirurgiya'),
		(1,'Fizio'),
		(2,'Travmatologiya'),
		(3,'Pediatriya');
		go

select * from yuriy.departments

drop table if exists yuriy.surveys;
go
create table yuriy.surveys (
id_sur int identity(1,1) primary key,
name_surveys varchar(100) not null unique,
FK_dep int references yuriy.departments(id_dep)
);
go

insert into yuriy.surveys ( fk_dep, name_surveys)
values
		(1, 'Ploskostopie'),
		(1,'Perelom nogi'),
		(3,'Perelom Chelusti'),
		(4,'Bronhit');
		go
select * from yuriy.surveys

drop table if exists yuriy.specialization;
go
create table yuriy.specialization (
id_spe int identity(1,1) primary key,
specialization varchar(80) not null
);
go
insert into yuriy.specialization (specialization)
values
('Otolaringolog'),
('Hirurg main practic'),
('Fizioterapevt'),
('Pediatr');
go

drop table if exists yuriy.diseases;
go
create table yuriy.diseases (
id_dis int identity(1,1) ,
nameof varchar(100) not null unique,
difficult int  check(difficult>=1) default(1),
primary key (id_dis,difficult)
);
go
insert into yuriy.diseases (nameof)
values
		('Bronhit'),
		('Rinit'),
		('Astma'),
		('Angina');
		go


drop table if exists yuriy.doctors;
go
create table yuriy.doctors (
id_doc int identity(1,1) primary key,
FK_dep int references yuriy.departments(id_dep),
FK_spe int references yuriy.specialization(id_spe),
Firstname varchar(50) not null,
Secondname varchar(50) not null,
phone varchar(15),
salary money not null check(salary>=0)
);
go
insert into yuriy.doctors (fk_dep,fk_spe,Firstname,Secondname,salary)
values
		(2, 1,'Kamil','Mursalimbaev', 350000),
		(1,2, 'Alisher', 'Jeksembinov', 400000),
		(3,3, 'Azamat','Sovet', 450000),
		(4,4, 'Daniil', 'Kim', 400000);
		go

drop table if exists yuriy.examinations;
go
create table yuriy.examinations (
id_exa int identity(1,1) primary key,
IIN varchar(12) not null,
dayof date not null,
timeof varchar(10) not null,
FK_sur int references yuriy.surveys(id_sur),
FK_doc int references yuriy.doctors(id_doc),
Summary varchar(250) not null
);
go




