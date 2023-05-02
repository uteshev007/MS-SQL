use tsql;
go

select o.orderid, o.productid, o.unitprice as PRICE
from sales.OrderDetails o
where o.orderid > 10500 and o.unitprice < 20
order by o.productid;

select *
from Sales.Customers
where country = 'france'
order by country

select custid, companyname, contactname, address, city, country, phone
from Sales.Customers
where contactname like  'a%'

SELECT 
c.custid, c.companyname, o.orderid 
FROM Sales.Customers AS c 
LEFT OUTER JOIN Sales.Orders AS o ON c.custid = o.custid AND c.city = N'Paris'; 


SELECT 
e.empid, e.lastname, e.firstname, e.title, e.mgrid, 
m.lastname AS mgrlastname, m.firstname AS mgrfirstname 
FROM HR.Employees AS e 
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid 
WHERE m.lastname = 'Buck'; 

