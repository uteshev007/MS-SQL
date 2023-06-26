use tsql;
go

drop table if exists production.avto;
go


create table production.avto(
idavto int primary key identity(1,1),
vendor varchar(20) not null,
model varchar(20),
qty int not null,
price int not null
);
go

insert into production.avto(vendor,model,qty,price)
values
('Audi', 'TT',12,28000),
('Audi','A6',5,47000),
('Opel','Omega',12,22000),
('VW','Passat',32,33000);


select *from Production.avto;
go
/*
alter table Production.avto
add description varchar(40) not null default('No Any Action');                                     -- dobavit novyy panel. Default - default fraza


alter table Production.avto
add discount float;                             --float - peremennya s plavayeshey zapatoy

*/

update Production.avto set description='BIG OPEL SALE'
where vendor ='opel';

update Production.avto set discount=0.1
where vendor ='opel';

select *, price-price*discount as 'price with Discount'

from production.avto;
go

delete from Production.avto
where vendor='opel'

-----------------------------------------------------------
create table hr.Sallers(
id_sallers int primary key identity(1,1),
FIO varchar(50) not null,
Startdate datetime not null default (sysdatetime()),
age int default (25) check(age>=18 and age <=63),
idx_salary int default (1)

);
go

insert into hr.Sallers(FIO)
values
('Kondratovich M V'),
('Toleybai S.'),
('Soviet A.');


select fio, year(startdate) , month(stardate),day(startdate)
from hr.Sallers;
go

create table sales.orderavto
(
id int primary key identity(1,1),
description varchar(100),
id_sallers int references hr.sallers(id_sallers),
idavto int  references production.avto(idavto)
);

insert into sales.orderavto (id_sallers, idavto)
values
(1,2),
(3,1);


select * from production.avto;
select * from hr.Sallers
select * from sales.orderavto

select o.id as 'OrderNumber',a.vendor,a.model,s.FIO as 'Seller'
from sales.orderavto o
join production.avto a
on o.idavto=a.idavto
join hr.Sallers s
on o.id_sallers=s.id_sallers