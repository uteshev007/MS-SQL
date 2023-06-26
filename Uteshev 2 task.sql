create view policlinic.finalsales
as
select sa.ProductID, sa.UnitPrice, sa.OrderQty, pr.ProductNumber, pr.Name,
sa.UnitPrice * sa.OrderQty as TotalSales
from AdventureWorks.Sales.SalesOrderDetail sa
join AdventureWorks.Production.Product pr
on sa.ProductID=pr.ProductID

select * from policlinic.finalsales