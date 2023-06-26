use tsql;
go

select e.lastname, e.firstname, e.title --,  count(o.orderid) as TOTAL_Orders
from hr.Employees e
join Sales.Orders o
on e.empid=o.empid
--group by e.lastname, e.firstname, e.title

select e.lastname, e.firstname, e.title ,  count(o.orderid) as TOTAL_Orders
from hr.Employees e
join Sales.Orders o
on e.empid=o.empid
group by e.lastname, e.firstname, e.title

select e.lastname, e.firstname, e.title,  year(o.orderdate) Year, 
count(o.orderid) as Year_Orders
from hr.Employees e
join Sales.Orders o
on e.empid=o.empid
group by e.lastname, e.firstname, e.title,  year(o.orderdate)


select (e.lastname + ' ' +e.firstname) as SALESManager, e.title,  year(o.orderdate) Year, 
count(o.orderid) as Year_Orders
from hr.Employees e
join Sales.Orders o
on e.empid=o.empid
group by e.lastname ,e.firstname, e.title,  year(o.orderdate)

------------------------------------------------------------
select orderid from sales.OrderDetails
order by orderid;
select empid, count (orderid) from sales.Orders
group by (empid);

create view view_00 as 
select o.orderid, od.productid, od.unitprice*od.qty as Summa
from sales.Orders o
join sales.OrderDetails od
on o.orderid=od.orderid

select orderid, sum(summa) from view_00
group by orderid;

;

create view dbo.view01 
as