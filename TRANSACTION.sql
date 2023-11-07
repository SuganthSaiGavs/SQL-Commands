--Transaction

USE Northwind
GO
BEGIN TRANSACTION
UPDATE dbo.Categories
SET CategoryName='Fishfood_venkat'
WHERE CategoryName='Seafood';

--ROLLBACK TRANSACTION
commit TRANSACTION
SELECT * from dbo.Categories

--With ROLLBACK
BEGIN TRANSACTION
UPDATE dbo.Categories
SET CategoryName='Fishfood_sangee'
WHERE CategoryName='Seafood';

ROLLBACK TRANSACTION
SELECT * from dbo.Categories
