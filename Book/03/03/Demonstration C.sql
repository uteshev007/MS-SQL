-- Demonstration C - Use the AdventureWorks database on MSSQL

-- Step 1: Connect to the AdventureWorks database

use AdventureWorks
go


-- Step 2: Column Aliases
-- Select and execute the following query to show the use of column aliases
-- in the SELECT clause

select *
FROM Production.Document

SELECT Filename AS NAME, Title, Owner, DocumentSummary AS Documentation
FROM Production.Document



-- Step 3: Column Aliases
-- Select and execute the following query to show the use of column aliases
-- to label calculated columns in the SELECT clause
SELECT ProductID, Name, ListPrice, (ListPrice * 1.1) AS MarkUp
FROM Production.Product


-- Step 4: Column Aliases
-- Select and execute the following query to show the use of column aliases
-- to label calculated columns in the SELECT clause
SELECT SalesOrderNumber, PurchaseOrderNumber, CustomerID, YEAR(OrderDate) AS YearPurchased 
FROM Sales.SalesOrderHeader


-- Step 5: Table Aliases
-- Select and execute the following query to show the use of table aliases
SELECT P.ProductNumber, P.Name, P.Color
FROM Production.Product AS P;