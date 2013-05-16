/* INSERT VALUES, INSERT SELECT, INSERT EXEC, SELECT INTO */

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

/* Can use the word default, or ignore a column entirely if table allows via soemthing like a default */


/* This is one transaction */
INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight) VALUES
	(2, 19, '20120620', N'USA', 30.00),
	(3, 18, '20120621', N'USA', 40.00);

/* Obviously not a real example, but the point stands */
INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)
	SELECT custid, empid, orderdate, shipcountry, freight
	FROM Sales.Orders
	WHERE shipcountry = N'Norway';

INSERT INTO Sales.MyOrders(custid, empid, orderdate, shipcountry, freight)
	EXEC StoredProcedureName
		@param = N'storedprocedureparam';


SELECT custid, empid, orderdate, shipcountry, freight
INTO Sales.MyOrders
FROM Sales.Orders
WHERE shipcountry = N'Norway';

/* SIMILARLY */
SELECT custid, empid, orderdate, shipcountry, freight
INTO #temporarytable
FROM Sales.Orders
WHERE shipcountry = N'Norway';
