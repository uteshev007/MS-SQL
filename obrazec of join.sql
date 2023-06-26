use tsql;
go
create schema itstep
authorization dbo;
go
/*
select * from hr.Employees

create view hr.shortlisttemployees as
select (lastname + ' ' +firstname) as FullName, country, city
from hr.Employees;

select * from hr.shortlisttemployees

drop view if exists itstep.bigtable;
go*/
create view itstep.bigtable as


select (e.lastname + ' ' +e.firstname) as FullNameofSeller, e.country, e.city,
o.orderid, cus.companyname as Company_Buyer, cus.contactname as Person_of_Buyer,
od.unitprice, od.qty, pro.productname,cat.categoryname, sup.companyname





from hr.Employees e
join Sales.Orders o
on e.empid=o.empid
join sales.Customers cus
on o.custid=cus.custid
join Sales.OrderDetails od
on o.orderid = od.orderid
join Production.Products pro
on pro.productid = od.productid
join Production.Suppliers sup
on sup.supplierid = pro.supplierid
join Production.Categories cat
on cat.categoryid = pro.categoryid;
go
select * from itstep.bigtable;
