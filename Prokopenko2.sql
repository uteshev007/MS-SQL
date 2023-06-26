use AdventureWorks;
go

select sod.ProductID, sod.UnitPrice, OrderQty as Unitsold, pp.name, pp.ProductNumber

from sales.SalesOrderDetail sod
join Production.Product pp
on sod.ProductID = pp.ProductID