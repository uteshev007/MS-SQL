use TSQL;
go

create table sales.SEP2223 (
Orderid int identity (1,1) primary key,
Shipcharacter nvarchar(20) not null,
Dateshippers date,
Daysofdelay int, 
Priceshipping decimal(10,2)
)
go

SET IDENTITY_INSERT sales.SEP2223 ON
insert into sales.SEP2223 (Orderid, Shipcharacter, Dateshippers, Daysofdelay, Priceshipping)
values 
	(1, 'car', '04-12-2018', 3, 2208),
	(2, 'seatransport', '06-23-2018', 4, 12098),
	(3, 'seatransport', '09-12-2018', 9, 34000),
	(4, 'avia', '08-09-2020', 0, 45000),
	(5, 'car', '04-05-2020', 4, 8000),
	(6, 'car', '07-23-2020', 5, 3408),
	(7, 'seatransport', '03-12-2019', 12, 56096),
	(8, 'rivertransport', '03-14-2018', 8, 33006),
	(9, 'car', '01-22-2020', 11, 15210),
	(10, 'rivertransport', '11-02-2020', 11, 15330),
	(11, 'car', '11-29-2021', 8, 14267),
	(12, 'avia', '10-20-2020', 1, 23000);
	go

	alter Table Sales.SEP2223
	add Description varchar(25);
	select * from Sales.SEP2223

	Select * from Sales.SEP2223 where Shipcharacter = 'avia';
	Select * from Sales.SEP2223 where Dateshippers >= '2019-01-01' and Dateshippers <= '2020-12-31';
	Select * from Sales.SEP2223 where Daysofdelay >= '3' and Daysofdelay <= '7';