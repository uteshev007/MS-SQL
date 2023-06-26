---------------------------------------------------------------------
-- LAB 09
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement that will return groups of customers that made a purchase. 
--The SELECT clause should include the custid column from the 
-- Sales.Orders table and the contactname column from the Sales.Customers table. 
-- Group by both columns and filter only the orders from 
-- the sales employee whose empid equals five.
--
-- .
---------------------------------------------------------------------
select o.custid, cus.contactname, count(*) Total_pURCHASE, 
(e.lastname + ' ' +e.firstname) salesman
from Sales.Orders o
join Sales.Customers cus
on o.custid=cus.custid
join hr.Employees e
on o.empid=e.empid
where o.empid=5
group by o.custid, cus.contactname, (e.lastname + ' ' +e.firstname)




---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement in task 2 and modify it to include the 
-- city column from the Sales.Customers table in the SELECT clause. 
--
-- Execute the query. You will get an error. What is the error message? Why?
--
-- Correct the query so that it will execute properly.
--
-- 
---------------------------------------------------------------------
select o.custid, cus.contactname, count(*) Total_pURCHASE, cus.city
from Sales.Orders o
join Sales.Customers cus
on o.custid=cus.custid
group by o.custid, cus.contactname
-- error



---------------------------------------------------------------------
-- Task 4
-- 
-- Write a SELECT statement that will return groups of rows based on the custid 
-- column and a calculated column orderyear
-- representing the order year based on the orderdate column from the Sales.Orders table. 
-- Filter the results 
-- to include only the orders from the sales employee whose empid equal five.
--
-- 
---------------------------------------------------------------------
select custid, year(orderdate), count(*)
from sales.Orders
where empid=5

group by custid,year(orderdate)


---------------------------------------------------------------------
-- Task 5
-- 
-- Write a SELECT statement to retrieve groups of rows based on the 
-- categoryname column in the Production.Categories table. 
-- Filter the results to include only the product categories that were ordered in the year 2008.
--
-- 
---------------------------------------------------------------------
select cat.categoryname , count(*)
from Production.Categories cat
join Production.Products pr
on cat.categoryid=pr.categoryid
join Sales.OrderDetails od
on pr.productid=od.productid
join Sales.Orders o
on od.orderid=o.orderid
where year(orderdate) =2008
group by cat.categoryname

select cat.categoryname , count(*), (e.lastname + ' ' +e.firstname) as totalsales_2006
from Production.Categories cat
join Production.Products pr
on cat.categoryid=pr.categoryid
join Sales.OrderDetails od
on pr.productid=od.productid
join Sales.Orders o
on od.orderid=o.orderid
join hr.Employees e
on o.empid=e.empid
where o.empid=5 and year(orderdate) = 2006
group by cat.categoryname, (e.lastname + ' ' +e.firstname)