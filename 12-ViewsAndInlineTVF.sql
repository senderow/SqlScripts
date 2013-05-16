USE TSQL2012;

/* Views work like CTEs, but are stored in the db, and don't take params */

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

/* Then in our query we could use */
SELECT categoryid, productid, productname, unitprice
FROM Sales.RankedProducts
WHERE rownum <= 2;

/* Alternatively, using the CTE example from #11, a inline TVF */

IF OBJECT_ID('HR.GetManagers', 'IF') IS NOT NULL DROP FUNCTION HR.GetManagers;
GO
CREATE FUNCTION HR.GetManagers(@empid AS INT) RETURNS TABLE
AS

RETURN
	WITH EmpsCTE AS
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
	SELECT empid, mgrid, firstname, lastname, distance
	FROM EmpsCTE;
GO

/* Later, we would call from a query with */
SELECT * 
FROM HR.GetManagers(9);

/*  Both views and TVFs can use the phrase WITH SCHEMABINDING so underlying table updates
    Are notified that this procedure needs to be updated */