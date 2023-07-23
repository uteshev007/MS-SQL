-- Demonstration B - Use the AdventureWorks database on MSSQL

-- Step 1: Connect to the AdventureWorks database
-- The USE statement is not currently compatible with MSSQL databases.
-- Instead, select AdventureWorks from the Available Databases list


-- Step 2: Include duplicate rows
-- Select and execute the following query to show duplicate rows 
-- returned from the Production.Product table. You should see 504 rows.
SELECT Color, Size 
FROM Production.Product;


-- Step 3: Filtering out duplicate rows
-- Select and execute the following query to show duplicate rows 
-- filtered from the Production.Product table. You should see 68 rows.
SELECT DISTINCT Color, Size 
FROM Production.Product;


-- Step 4: Select Disctinct
-- Select and execute the following query to show that DISTINCT across 
-- a column list that already includes a key will not filter duplicates. 
-- You should see 504 rows. 
-- Point out the orderid key column for the Production.Product table in the Object Explorer.
-- You may want to show the same statement without DISTINCT, for comparison.
SELECT DISTINCT ProductID, Color, Size 
FROM Production.Product;