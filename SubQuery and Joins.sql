
--Sub Queries(query inside query)
SELECT CompanyName FROM Customers WHERE CustomerID=(SELECT CustomerID FROM Orders Where OrderId=10290);  --InnerQuery will execute first

SELECT CompanyName FROM Customers WHERE CustomerID IN(SELECT CustomerID FROM Orders WHERE OrderDate BETWEEN '1-Jan-1997' AND '31-DEC-1997');

SELECT CompanyName FROM Customers WHERE CustomerID IN(SELECT CustomerID FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-12-31');

SELECT * FROM Suppliers Where CompanyName='Grandma Kelly''s Homestead';

--1. Create a query that shows all products by name that are in the Seafood Category
SELECT  ProductName AS SeaFodProducts from Products Where CategoryID=(SELECT CategoryId from Categories where CategoryName='Seafood');

--2. Create a query that shows all companies by name that sell products in CategoryID 8
SELECT CompanyName 
FROM Suppliers 
WHERE SupplierID IN
    (SELECT SupplierID FROM Products WHERE CategoryID = 8);

--3.Create a query that shows all companies by name that sell products in the seafood category
SELECT CompanyName 
FROM Suppliers 
WHERE SupplierID IN 
    (
        SELECT SupplierID 
        FROM Products 
        WHERE CategoryID = 
            (
                SELECT CategoryID 
                FROM Categories 
                WHERE CategoryName = 'seafood'
            )
    );

--4.Create a query that shows the product name and supplier id for all products supplied by Exotic Liquids, 
--Grandma Kelly's Homestead, and Tokyo Traders. You will need to escape the apostrophe in "Grandma Kelly's Homestead." 
--To do so, place another apostrophe in front of it.
SELECT ProductName, SupplierID 
FROM Products 
WHERE SupplierID IN 
    (
        SELECT SupplierID 
        FROM Suppliers 
        WHERE CompanyName IN ('Exotic Liquids', 'Grandma Kelly''s Homestead', 'Tokyo Traders')
    );

--JOINS (Similar to Sub Query):
Select Employees.EmployeeID,Employees.FirstName,Employees.LastName,Orders.OrderID,Orders.OrderDate From Employees 
JOIN Orders ON(Employees.EmployeeID=Orders.EmployeeID) ORDER BY Orders.OrderDate;

--Create a report showing employee orders using Aliases(e and o are aliases)
SELECT e.EmployeeID,e.FirstName,e.LastName,o.OrderID,o.OrderDate
FROM Employees e JOIN Orders o ON
(e.EmployeeID=O.EmployeeID)
ORDER BY o.OrderDate;

--Multi-Table Joins
--Create a report showing the OrderID,
--the name of the company that placed the order,and the first and last name of the associated employee. 
--Only show orders placed after january1,1998 that shipped after they were required.Sort by Company Name. 
SELECT 
    o.OrderID,
    c.CompanyName,
    e.FirstName,
    e.LastName
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    Employees e ON o.EmployeeID = e.EmployeeID
WHERE 
    o.OrderDate > '1998-01-01' 
    AND o.ShippedDate > o.RequiredDate
ORDER BY 
    c.CompanyName;

--Create a report that shows the number of employees and customers from each city that has employee in it
SELECT  
    COUNT(DISTINCT e.EmployeeID) as NumberOfEmployees,
    COUNT(DISTINCT c.CustomerID) as NumberOfCustomers,
	 e.City,
	 c.City
FROM 
    Employees e
JOIN 
    Customers c ON e.City = c.City
GROUP BY 
    e.City,c.City
ORDER BY 
    NumberOfEmployees DESC;

--Left Join: (Returns all rows from left table and matched rows from right table.)
SELECT  
    COUNT(DISTINCT e.EmployeeID) as NumberOfEmployees,
    COUNT(DISTINCT c.CustomerID) as NumberOfCustomers,
	 e.City,
	 c.City
FROM 
    Employees e --left table
LEFT JOIN 
    Customers c ON e.City = c.City --joins matched rows in right table
GROUP BY 
    e.City,c.City
ORDER BY 
    NumberOfEmployees DESC;

--Right Join:
SELECT  
    COUNT(DISTINCT e.EmployeeID) as NumberOfEmployees,
    COUNT(DISTINCT c.CustomerID) as NumberOfCustomers,
	 e.City,
	 c.City
FROM 
    Employees e --joins matched rows in left table
Right JOIN 
    Customers c ON e.City = c.City -- all rows in right table
GROUP BY 
    e.City,c.City
ORDER BY 
    NumberOfEmployees DESC;

-- Full Join:
SELECT  
    COUNT(DISTINCT e.EmployeeID) as NumberOfEmployees,
    COUNT(DISTINCT c.CustomerID) as NumberOfCustomers,
	 e.City,
	 c.City
FROM 
    Employees e --all rows in left table
Full JOIN 
    Customers c ON e.City = c.City -- all rows in right table
GROUP BY 
    e.City,c.City
ORDER BY 
    NumberOfEmployees DESC;

--Get the phone number of all shipper,customers and suppliers
--UNION:
SELECT CompanyName,Phone
FROM Shippers

UNION

SELECT CompanyName,Phone
FROM Customers

UNION

SELECT CompanyName,Phone
FROM Suppliers
ORDER BY CompanyName;

--1.Create a report that show the order ids and the associated employee name for orders that shipped after the required date.
--There should be 37 rows returned
SELECT 
   e.FirstName,
	e.LastName,
	o.OrderID
   -- CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM 
    Orders o
Inner JOIN 
    Employees e ON o.EmployeeID = e.EmployeeID
WHERE 
    o.ShippedDate > o.RequiredDate
ORDER by
	e.LastName,e.FirstName

--2.Create a report that shows the total quantity of products(from the [Order Details] table) ordered.
--Only show record for products for which the quantity ordered is fewer than 200.The following should return 5 rows.

SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantity
FROM 
    [Order Details] od
JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName
HAVING
    SUM(od.Quantity) < 200;

--3.Create a report that shows the total number of orders by customer since December 31,1996.
--The report should only return rows for which the NumOrders is greater than 15.This should return 5 rows.

SELECT 
    c.CompanyName,
    COUNT(o.OrderID) AS NumOrders
FROM 
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    o.OrderDate > '1996-12-31'
GROUP BY 
    c.CompanyName
HAVING 
    COUNT(o.OrderID) > 15
ORDER BY 
	NumOrders DESC;

--4.Create a report that shows the company name, orderid and total price of all products of that has sold more than $10,000 worth.
--(There is no need for a GROUP BY clause in this report.)

SELECT 
    c.CompanyName,
    o.OrderID,
    od.UnitPrice*od.Quantity*(1-od.Discount) As TotalPrice
FROM 
    [Order Details] od
JOIN 
    Orders o ON (o.OrderID = od.OrderID)
JOIN 
    Customers c ON (c.CustomerID = o.CustomerID)
WHERE 
    od.UnitPrice * od.Quantity*(1-od.Discount) > 10000
ORDER BY TotalPrice DESC;

--5.Create a report showing the contact name and phone numbers for all employees,customers and suppliers
-- Retrieve data from Employees table
SELECT CONCAT(FirstName, ' ', LastName) AS ContactName, HomePhone AS Phone
FROM Employees

UNION
-- Retrieve data from Customers table
SELECT ContactName AS ContactName, Phone AS Phone
FROM Customers

UNION

-- Retrieve data from Suppliers table
SELECT ContactName AS ContactName, Phone AS Phone
FROM Suppliers;

--Self Join:

SELECT EmployeeID,FirstName,ReportsTo,Title
FROM Employees;

SELECT e1.EmployeeID,e1.FirstName,e2.FirstName as ManagerName,e1.Title  --join in same table itself.
FROM Employees e1 inner join Employees e2 on e1.ReportsTo=e2.EmployeeID

--sub query
SELECT* FROM Orders where Freight in(SELECT TOP 3 freight from orders order by Freight desc); -- ORDER BY is valid only when TOP is used.

--Inline or Derived Table:
SELECT min(BirthDate) FROM(Select top 3 BirthDate from Employees order by BirthDate desc)a;
--SELECT min(BirthDate) from Employees where BirthDate IN(Select top 3 BirthDate from Employees order by BirthDate desc)



Select OrderID,Freight from Orders

Select OrderID,Freight from Orders order by Freight asc

Select top 3 Freight from Orders order by Freight asc

Select OrderID,Freight from Orders order by Freight desc

Select top 3 Freight from Orders order by Freight desc

--Third highest freight
Select Min(Freight)from (select top 3 freight from Orders order by Freight desc) a

