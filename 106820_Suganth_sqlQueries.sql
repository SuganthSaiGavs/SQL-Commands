CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
)

INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName, AreaCode,
Address, Phone)
VALUES ('1000', 'Smith', 'John', 12, 'California', '11111111')

INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName, AreaCode,
Address, Phone)
VALUES ('1001', 'Sanjay', 'Ram', 12, 'Delhi', '11111112')

INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName, AreaCode,
Address, Phone)
VALUES ('1002', 'Akshara', 'Banu', 40, 'Chennai', '11111113')

update CUSTOMER set AreaCode=46 where CustomerId=2

delete from CUSTOMER where CustomerId=2

select * from CUSTOMER

select CustomerId, LastName, FirstName from CUSTOMER

select * from CUSTOMER order by LastName

select * from CUSTOMER order by Address, LastName

select * from CUSTOMER order by LastName desc

select distinct FirstName from CUSTOMER

select * from CUSTOMER where CustomerNumber='1001'

select * from CUSTOMER where AreaCode>30

select * from CUSTOMER where LastName like 's%'

select * from CUSTOMER where LastName like '%a%'

SELECT * FROM CUSTOMER WHERE LastName LIKE 'S_it_' 

SELECT * FROM CUSTOMER WHERE CustomerNumber LIKE '[10]%'

select * from CUSTOMER where LastName='Smith' and FirstName='John'

select * from CUSTOMER
where LastName='Smith' and (FirstName='John' or FirstName='Smith')

select TOP 1 * from CUSTOMER
select TOP 25 percent * from CUSTOMER

CREATE TABLE SCHOOL
(
SchoolId int IDENTITY(1,1) PRIMARY KEY,
SchoolName varchar(50) NOT NULL UNIQUE,
Description varchar(1000) NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
PostCode varchar(50) NULL,
PostAddress varchar(50) NULL,
)

insert into SCHOOL values ('velammal','matric','tvm','11111111','12','c1')
insert into SCHOOL values ('jp','cbse','tvm','12121212','12','d1')
insert into SCHOOL values ('gopal','matric','tvm','34343434','14','c1')
insert into SCHOOL values ('sboa','matric','tvm','67676767','15','d1')
insert into SCHOOL values ('dav','cbse','tvm','98989898','15','e1')
insert into SCHOOL values ('CP','cbse','tvm','65656565','11','c1')

select * from SCHOOL

CREATE TABLE CLASS
(
ClassId int IDENTITY(1,1) PRIMARY KEY,
SchoolId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
ClassName varchar(50) NOT NULL UNIQUE,
Description varchar(1000) NULL,
)

insert into CLASS values('1','eng','language')
insert into CLASS values('1','tam','language')
insert into CLASS values('1','science','science')
insert into CLASS values('5','maths','science')
insert into CLASS values('5','social','science')

select * from CLASS

select SCHOOL.SchoolName, CLASS.ClassName from SCHOOL INNER JOIN CLASS ON SCHOOL.SchoolId = CLASS.SchoolId

declare @myvariable int
set @myvariable=4
print @myvariable

declare @mylastname varchar(50)
select @mylastname=LastName from CUSTOMER where CustomerId=5
print @mylastname

declare @find varchar(30)
set @find = 'S%'
select * from CUSTOMER
where LastName LIKE @find

 CREATE TABLE COURSE
(
CourseId int IDENTITY(1,1) PRIMARY KEY,
ClassId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
CourseName varchar(50) NOT NULL UNIQUE,
Description varchar(1000) NULL,
)

insert into COURSE values ('1','1','null')
insert into COURSE values ('1','2','null')
insert into COURSE values ('1','3','null')

declare @customerNumber int
select @customerNumber=CustomerNumber from CUSTOMER 
where CustomerId=5


SET @customerNumber = 1000 
if @customerNumber > 1002
print 'The Customer Number is larger than 1000'
else
print 'The Customer Number is not larger than 1000'

while (select AreaCode from CUSTOMER where CustomerId=1) < 25
begin
update CUSTOMER set AreaCode = AreaCode + 3
end

select * from CUSTOMER

create table Grades
(
GradeId int ,StudentId int not null,
CourseId int,Grade int
)

insert into Grades values ('1','101','1','4')
insert into Grades values ('2','102','1','3')
insert into Grades values ('3','101','2','5')
insert into Grades values ('4','101','3','2')

select GradeId, StudentId, CourseId,
case Grade
when 5 then 'A'
when 4 then 'B'
when 3 then 'C'
when 2 then 'D'
when 1 then 'E'
when 0 then 'F'
else '-'
end as Grade from Grades
--Validation Checker for Phone Number(1)
DECLARE
@CustomerId int, 
@phone varchar(50) 

DECLARE db_cursor CURSOR 
FOR SELECT CustomerId from CUSTOMER 
OPEN db_cursor 
FETCH NEXT FROM db_cursor INTO @CustomerId 
WHILE @@FETCH_STATUS = 0 
BEGIN 

select @phone=Phone from CUSTOMER where CustomerId=@CustomerId

if LEN(@phone) < 9
update CUSTOMER set Phone='Phone number is not valid' where 
CustomerId=@CustomerId
FETCH NEXT FROM db_cursor INTO @CustomerId 
END 
CLOSE db_cursor 
DEALLOCATE db_cursor

insert into CUSTOMER values('1010','David','Warner','45','Asia','7683684874')
select * from CUSTOMER

GO  -- Ensuring the CREATE VIEW is the only statement in this batch
CREATE VIEW SchoolView AS 
SELECT 
    SCHOOL.SchoolName, 
    CLASS.ClassName
FROM 
    SCHOOL
INNER JOIN 
    CLASS 
ON 
    SCHOOL.SchoolId = CLASS.SchoolId;

GO  -- End of this batch

select * from SchoolView

GO
CREATE PROCEDURE GetAllSchoolClasses AS
select SCHOOL.SchoolName, CLASS.ClassName from SCHOOL
inner join CLASS on SCHOOL.SchoolId = CLASS.SchoolId order by SchoolName, ClassName
GO

execute GetAllSchoolClasses

Go
CREATE PROCEDURE GetSpecificSchoolClasses
@SchoolName varchar(50) AS select SCHOOL.SchoolName, CLASS.ClassName
from SCHOOL inner join CLASS on SCHOOL.SchoolId = CLASS.SchoolId
where SchoolName=@SchoolName
 Go

execute GetSpecificSchoolClasses 'dav'

select * from CLASS

execute GetSpecificSchoolClasses 'dav'

GO

CREATE PROCEDURE GetSpecificSchoolClassess
@SchoolName varchar(50)
AS
BEGIN
    SELECT SCHOOL.SchoolName, CLASS.ClassName 
    FROM SCHOOL
    INNER JOIN CLASS ON SCHOOL.SchoolId = CLASS.SchoolId
    WHERE SCHOOL.SchoolName = @SchoolName
    ORDER BY ClassName;
END
GO

select AVG(Grade) as AvgGrade from Grades where StudentId=101

select * from Grades

select COUNT(*) as NumbersofCustomers from CUSTOMER

select FirstName, MAX(AreaCode) from CUSTOMER group by FirstName

select CourseId, AVG(Grade) from Grades group by CourseId

select CourseId, AVG(Grade) from Grades group by CourseId having AVG(Grade)>3


IF EXISTS (SELECT name 
FROM sysobjects 
WHERE name = 'CheckPhoneNumber' 
AND type = 'TR')
DROP TRIGGER CheckPhoneNumber
GO
CREATE TRIGGER CheckPhoneNumber ON CUSTOMER
FOR UPDATE, INSERT
AS
DECLARE
@CustomerId int,
@Phone varchar(50),
@Message varchar(50)
set nocount on
select @CustomerId = CustomerId from INSERTED
select @Phone = Phone from INSERTED
set @Message = 'Phone Number ' + @Phone + ' is not valid'
if len(@Phone) < 8 --Check if Phone Number have less than 8 digits 
update CUSTOMER set Phone = @Message where CustomerId = @CustomerId
set nocount off
GO

INSERT INTO CUSTOMER (CustomerNumber, LastName, FirstName, AreaCode, Address, Phone) VALUES
('1012', 'Sontosh', 'Raj', 52, 'Africa', '4444')

update CUSTOMER set Phone = '44444444' where CustomerNumber = '1012'