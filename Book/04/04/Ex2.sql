---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
--
-- Execute the query exactly as written inside a query window and observe the result.
--
-- You get an error. What is the error message? Why do you think you got this error? 
---------------------------------------------------------------------

SELECT 
	custid, contactname, orderid
FROM Sales.Customers  
INNER JOIN Sales.Orders ON Customers.custid = Orders.custid;




---------------------------------------------------------------------
-- Task 2
-- 
-- USE full source table names written as table aliases. 
--
-- Copy T-SQL statement from task1 and fix it. start it.
--
---------------------------------------------------------------------




---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement from task 2 and modify it to use the table aliases “C” for the Sales.Custumers 
-- table and “O” for the Sales.Orders table.
--
-- Execute the written statement and compare the results with the results in task 2.
--
-- Change the prefix of the columns in the SELECT statement with full source table names and
-- execute the statement.
--
-- You get an error. Why?
--
-- Change the SELECT statement to use the table aliases written at the beginning of the task.
---------------------------------------------------------------------




---------------------------------------------------------------------
-- Task 4
-- 
-- Copy the T-SQL statement from task 3 and modify it to include three additional columns from the 
-- Sales.OrderDetails table: productid, qty, and unitprice.
--
-- Execute the written statement  
---------------------------------------------------------------------


