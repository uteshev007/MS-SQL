use tsql;
go

/*
select e.lastname+' ' +e.firstname as SALESman, e.title from HR.employees e
join sales.orders o
on e.empid=o.empid
--and the total sales(qty)  in for each year of sales.orders.
*/

--1 task
drop view if exists sales.view001;
go
create view  sales.view001 
as
select e.lastname+' ' +e.firstname as SALESman, e.title, year(o.orderdate) Year, 
count(o.orderid) as TotalSales
from HR.employees e
join sales.orders o
on e.empid=o.empid
group by e.lastname+' ' +e.firstname , e.title, year(orderdate);
go
select * from view001;
go


--2 task
drop view if exists sales.view002;
go
create view sales.view002 as
select e.lastname+' ' +e.firstname as SALESman, e.title, count(o.orderid) as TotalSales
from HR.employees e
join sales.orders o
on e.empid=o.empid
group by e.lastname+' ' +e.firstname , e.title;
go
select * from view002;
go
-- 3 task
drop view if exists sales.view003;
go
create view sales.view003 as 
select o.orderid, sum(od.qty*od.unitprice) as SUMMa
from sales.orders o
join sales.OrderDetails od
on o.orderid=od.orderid
group by o.orderid;
go

drop view if exists sales.view004;
go
create view sales.view004 as 
select e.lastname+' ' +e.firstname as SALESman, e.title, 
count(o.orderid) as TotalSales, sum(v.summa) Summa
from HR.employees e
join sales.orders o
on e.empid=o.empid
join sales.view003 v
on o.orderid=v.orderid
group by e.lastname+' ' +e.firstname , e.title;
go
select * from Sales.view004;
go
/*
select e.lastname+' ' +e.firstname as SALESman, e.title, count(o.orderid) as TotalSales
from HR.employees e
join sales.orders o
on e.empid=o.empid

group by e.lastname+' ' +e.firstname , e.title;

select * from sales.orders
*/