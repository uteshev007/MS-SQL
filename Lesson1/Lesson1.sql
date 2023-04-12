use tsql;
go

select * from HR.Employees

create table avto (
id_avto int identity (1,1) primary key, 
vendor nvarchar(50) not null,
model varchar(50) not null,
qty int,
price int, 
info varchar (100)
);
go

insert into dbo.avto (vendor, model, qty, price)
values 
	('Audi', 'TT', 22, 45000),
	('Audi', 'A6', 12, 65000),
	('VW', 'Caravella', 3, 90000),
	('Opel', 'Omega', 12, 46000);
	go

select *, avto.price*avto.qty as Paid_Price, avto.price*avto.qty*.2 as sales_percent,
(avto.price*avto.qty + avto.price*avto.qty*.2) /qty SalesPrice from dbo.avto



use tsql;
go
select * from Sales.OrderDetails


