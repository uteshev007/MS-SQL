create view policlinic.finalsales
as
select sa.ProductID, sa.UnitPrice, sa.OrderQty, pr.ProductNumber, pr.Name,
sa.UnitPrice * sa.OrderQty as TotalSales
from AdventureWorks.Sales.SalesOrderDetail sa
join AdventureWorks.Production.Product pr
on sa.ProductID=pr.ProductID

select * from policlinic.finalsales

select
sa.ProductID, sa.UnitPrice, sa.OrderQty, pr.ProductNumber, pr.Name,
sa.UnitPrice * sa.OrderQty as TotalSales
from AdventureWorks.Sales.SalesOrderDetail sa
join AdventureWorks.Production.Product pr
on sa.ProductID=pr.ProductID

use TSQL
go

drop view if exists view1;
go

create view view1 as
select e.lastname+ ' ' +e.firstname as Salesmanager, e.title, year(o.orderdate) as Year, count(o.orderid) TotalOrders
from hr.Employees e
join Sales.Orders o
on e.empid = o.empid
group by e.lastname+ ' ' +e.firstname, e.title, year(o.orderdate)

select * from view2 
select e.lastname+ ' ' +e.firstname as Salesmanager, e.title, count(o.orderid) TotalOrders
from hr.Employees e
join Sales.Orders o
on e.empid = o.empid
group by e.lastname+ ' ' +e.firstname, e.title

select * from Sales.Orders