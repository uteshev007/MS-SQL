-- Demonstration A - Use the AdventureWorks database on SQL Azure

-- Step 1: Connect to the AdventureWorks database
-- The USE statement is not currently compatible with SQL Azure databases.
-- Instead, select AdventureWorks from the Available Databases list


-- Step 2: Simple SELECT query
-- Select and execute the following query to retrieve all columns, 
-- all rows from Production.ProductCategory table
use AdventureWorks
go

SELECT *
FROM Production.ProductCategory;


-- Step 3: Simple SELECT query
-- Select and execute the following query to retrieve all columns, 
-- all rows from Production.ProductCategory table without using *
SELECT ProductCategoryID,  Name, rowguid, ModifiedDate
FROM Production.ProductCategory;


-- Step 4: Simple SELECT query
-- Select and execute the following query to retrieve only ProductNumber, 
-- Name, Color, ListPrice columns from the Production.Product table
SELECT ProductNumber, Name, Color, ListPrice
FROM Production.Product;
  


-- Step 5: Simple SELECT query
-- Select and execute the following query to retrieve only Name, ProductNumber,Color,
-- Size, Weight columns from the Production.Product table
SELECT Name, ProductNumber,Color,Size,Weight
FROM Production.Product;

select *
FROM Production.Product;


-- Step 6: Simple SELECT query with calculated column
-- Select and execute the following query to manipulate columns from Production.Product table. 
-- Note the lack of name for the new calculated column.
SELECT ProductID, Name, ListPrice, (ListPrice * 1.1)
FROM Production.Product;


-- Step 7: Simple SELECT query with calculated column
-- Select and execute the following query to manipulate columns from the Sales.OrderDetails table. 
-- Note the lack of name for the new calculated column.
SELECT SalesOrderID, ProductID, UnitPrice, OrderQty, (UnitPrice * OrderQty)
FROM Sales.SalesOrderDetail;