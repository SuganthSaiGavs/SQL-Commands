Select COUNT(*) AS NumEmployees FROM Employees;

SELECT SUM(Quantity) AS TotalUnits FROM[Order Details] where ProductId=3;

Select COUNT(Quantity) AS NumProduct FROM[Order Details] where ProductId=3;

SELECT AVG(UnitPrice) AS AveragePrice FROM products;

SELECT City,COUNT(EmployeeID) AS NumEmployees FROM Employees GROUP BY City;

SELECT City,COUNT(EmployeeID) AS NumEmployees FROM Employees GROUP BY City HAVING COUNT (EmployeeID)>1;

Select DISTINCT City FROM Employees ORDER BY City;

select COUNT(DISTINCT City) As NumCities FROM Employees;

SELECT ProductID,SUM(Quantity) AS TotalUnits
FROM [Order Details] GROUP BY ProductID HAVING SUM(Quantity)<200

SELECT ProductID,AVG(UnitPrice) AS AveragePrice FROM Products GROUP BY ProductID HAVING AVG(UnitPrice)>70 ORDER BY AveragePrice

SELECT CustomerId,Count(OrderId) AS NumOrders From orders GROUP By CustomerID HAVING COUNT (OrderId)>15 ORDER BY NumOrders DESC; 

SELECT ProductID,UnitPrice FROM Products WHERE UnitPrice>70 ORDER BY UnitPrice;

--List Freight as is and freight rounded to the first decimal (eg: 1.150 becomes 1.200) from the orders table
SELECT Freight,ROUND(Freight,1) AS ApproxFreight FROM Orders;

--Select the unit price as is and unit price as a CHAR(10) from the products tables
SELECT UnitPrice,CAST(UnitPrice AS CHAR(10)) FROM Products;
SELECT UnitPrice,'$'+CAST(UnitPrice AS CHAR(10)) FROM Products;
SELECT UPPER(FirstName),UPPER(LastName) FROM Employees;
SELECT SUBSTRING(Address,1,10) FROM Customers;

--Date Functions
SELECT LastName,BirthDate,HireDate,DATEDIFF(Year,BirthDate,HireDate) AS HireAge FROM Employees ORDER BY HireAge

SELECT FirstName,LastName, DATENAME(month,BirthDate) AS BirthMonth,DATEPART(month,BirthDate) FROM Employees ORDER BY DATEPART(month,BirthDate); 

