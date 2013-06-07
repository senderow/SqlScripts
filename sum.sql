SELECT columnName as alias
From DBOName.TableName;

SELECT Count(*) AS numEployees
FROM DBOName.TableName;

SELECT columnName
FROM DbO.TableName
WHeRE columnName = 'Something';

SELECT columnName
FROM DBO.TableName
WHERE columnName LIKE REGEX

USE DBO;

SELECT TOP(20) columnName1, columnName2
FROM DBO.TableNameW
WHERE columnName1 Like REGEX
ORDER BY columnName2
OFFSET 25



SELECT columnName1, columnName2
FROM Dbo.TableName AS tableName1
	INNER JOIN DBO.tablename2 as tablename2
	ON tableName1.ID = tableName2.ID;


CREATE TABLE Customer
(
	columnName type null or not null,
	constRAint customers_pk PRIMARY KEY (customer_id)
)

CREATE TABLE Employee
( 
  employee_number int not null,
  employee_name varchar(50) not null,
  department_id int,
  salary int,
  CONSTRAINT employees_pk PRIMARY KEY (employee_number),
  CONSTRAINT fk_departments
    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

/* You can declare variables */
DECLARE @param AS INT = 25

SELECT johnny
WHERE columnName > @param
GO;

WITH cteName AS
(
	SELECT ROW_Number() OVER(PARTITION BY tableId) AS rownum,
	FROM DBO.TableName
)
SELECT recordName
FROM cteName
WHERE rownum < 2;

/* RECURSIVE CTEs */
WITH empsCTE AS 
(
	SELECT empid, mgrid, firstname, lastname, 0 AS distance
	FROM HR.Employees
	WHERE empid = 9

	UNION ALL

	SELECT M.empid, M.mgrid, M.firstname, M.lastname, S.distance + 1 AS distance
	FROM empsCTE AS S
		INNER JOIN HR.Employees AS M
			ON S.mgrid = M.empid
)
SELECT empid, mgrid, firstname,l



IF OBJECT_ID('Sales.RankedProducts', 'V') IS NOT NULL DROP VIEW Sales.RankedProducts;
GO
CREATE VIEW Sales.RankedProducts
AS

SELECT
	ROW_NUMBER() OVER(PARTITION BY categoryid
					  ORDER BY unitprice, productid) AS rownum,
	categoryid, productid, productname, unitprice
FROM Production.Products;
GO

APPLY is a foreach, so if we wanted to return the two cheapest products for each manufacturer in our db, we would use an APPLY statement.



populating a new table
use TSQL2012;

IF OBJECT_ID('Sales.MyOrders') IS NOT NULL DROP TABLE Sales.MyOrders;
GO

CREATE TABLE Sales.MyOrders
(
	orderid INT NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_MyOrders_orderid PRIMARY KEY,
	custid INT NOT NULL,
	empid INT NOT NULL,
	orderdate DATE NOT NULL
		CONSTRAINT DFT_MyOrders_orderdate DEFAULT (CAST(SYSDATETIME() AS DATE)),
	shipcountry NVARCHAR(15) NOT NULL,
	freight MONEY NOT NULL
);


INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)
	VALUES(2, 19, '20120620', N'USA', 30.00);




/* truncate doesn't log as much as delete.  */



IF OBJECT_ID('Sales.GetCustomerOrders', 'P') IS NOT NULL DROP PROC Sales.GetCustomerOrders;
GO

CREATE PROC Sales.GetCustomerOrders
	@custid AS INT,
	@orderdate AS DATETIME = '19000101',
	@numrows AS INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT orderid, custid
	FROM Sales.Orders
	WHERE custid = @custid
		AND orderdate >= @orderdate
	SET @numrows = @@ROWCOUNT
	RETURN;
END
GO

/* ---- */
DECLARE @var AS INT;
EXEC Sales.GetCustomerOrders
	@custid = 37,
	@orderdate = '20070401'
	@numrows = @rowsreturns OUTPUT
SELECT @rowsreturned AS "Rows Returned";
GO

