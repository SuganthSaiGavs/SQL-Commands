use Northwind;
--SQL is not case-sensitive, the commands need not to be same case with table fields
Select * FROM Employees;

SELECT EmployeeID,FirstName,LastName,City FROM Employees;

--WHERE clause is like if statement.
SELECT EmployeeID,FirstName,LastName,HireDate,City FROM Employees where City='London';

--select only those rows where the value in the "City" column is not equal to ('<>' means "not equal to") 'London'
SELECT EmployeeID,FirstName,LastName,HireDate,City FROM Employees WHERE City <> 'London'; 

--select only those rows where the value in the "HireDate" column is greater than or equal to July 1, 1993
SELECT EmployeeID,FirstName,LastName,HireDate,City FROM Employees WHERE HireDate >='1-july-1993';

SELECT CategoryName,Description FROM Categories;

SELECT ContactName,CompanyName,ContactTitle,Phone FROM Customers;

SELECT EmployeeID,Title,FirstName,LastName,Region FROM Employees;

SELECT RegionID,RegionDescription FROM Region;

SELECT CompanyName,Fax,Phone,HomePage FROM Suppliers;

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where (HireDate >= '1-june-1992') AND (HireDate <= '15-december-1993');

--Perfomance wise, BETWEEN is faster
SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where HireDate BETWEEN '1-june-1992' AND '15-december-1993'

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where HireDate NOT BETWEEN '1-june-1992' AND '15-december-1993'

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where City='London' OR City='Seattle'

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where City IN ('Seattle','Tacoma','Redmond');

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where City NOT IN ('Seattle','Tacoma','Redmond');

--Wild Chars
SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where(FirstName NOT LIKE'M%') AND (FirstName NOT LIKE 'A%')

--matches first single character with specfied range
SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where FirstName LIKE '[a-M]%'

--matches first single character not(^) with specfied range
SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees Where FirstName LIKE '[^a-M]%'

SELECT EmployeeID,FirstName,LastName,HireDate,City From Employees ORDER BY City

--ORDER BY is ascending order(Country),Only City is descending
SELECT EmployeeID,FirstName,LastName,HireDate,Country,City From Employees ORDER BY Country,City DESC

SELECT EmployeeID,FirstName,LastName,HireDate,Country,City From Employees ORDER BY Country Desc,City DESC

--1=Title, 3=LastName
SELECT Title,FirstName,LastName FROM Employees ORDER BY 1,3;

SELECT EmployeeID,FirstName,LastName FROM Employees ORDER BY Title,LastName;

--Questions:
--1. List CategoryName and Description from the Categories table sorted by CategoryName.
SELECT CategoryName,Description FROM Categories ORDER BY CategoryName;

--2. Display ContactName,CompanyName,ContactTile and Phone from the Customers table sorted by Phone.
Select ContactName,CompanyName,ContactTitle,Phone from Customers ORDER BY Phone;

--3. Create a query showing employees first and  last names and hire dates sorted from newest to oldest employee.
Select firstName,lastName,HireDate from Employees ORDER By HireDate Desc

--4.Create a query showing orders sorted by Freight from most expensive to cheapest. Show OrderID,OdersDate,ShippedDate,CustomerID,and Freight.
SELECT OrderID,OrderDate,ShippedDate,CustomerID,Freight from Orders ORDER BY Freight Desc

--5.Select CompanyName,Fax,Phone,HomePage and Country from the suppliers table sorted by Country in descending order and then  by CompanyName in ascending order.
SELECT CompanyName,Fax,Phone,HomePage,Country FROM Suppliers ORDER BY Country Desc,CompanyName

--6.Create a list of employees showing title,firstname,lastname.SOrt by Title in ascending order and then by Lastname in descending order.
SELECT title,firstname,lastname from Employees ORDER BY Title ASC,LastName DESC;

--IS NULL and IS NOT NULL:
SELECT FirstName,lastname,Region from Employees Where Region IS NULL;
SELECT FirstName,lastname,Region from Employees Where Region IS NOT NULL;

--Questions:
--1.Create a query showing all the company names and contact names of customers in Buenos Aires.
Select companyName,ContactName from customers WHERE City = 'Buenos Aires';

--2.Create a query showing the product name, unit price and quantity per unit all products that are out of stock.
SELECT productname, unitprice, QuantityPerUnit,UnitsInStock from Products WHERE UnitsInStock = 0;

--3.Create a query showing the order date,shipped date,customer id, and freight of all orders placed on May 19,1997.
SELECT  orderdate,shippeddate,customerId,freight from Orders where OrderDate='19-May-1997';

--4.Create a query showing the first name, lastname, and country of all employess not in the united states
SELECT FirstName,LastName,Country from Employees WHERE Country <> 'USA';

SELECT FirstName+ '' + LastName from Employees;

SELECT [OrderID],[Freight],[Freight]*0.1 Tax from [Orders] Where Freight >=500;  --Tax becomes column

SELECT OrderId,Freight,Freight*1.1 AS FreightTOTAL from orders Where Freight >=500;

