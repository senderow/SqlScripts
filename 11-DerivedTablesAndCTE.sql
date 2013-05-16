USE TSQL2012;

/* Because ROW_NUMBER must be used in a select statement, and WHERE is executed before SELECT, 
   but this is apparently good code, no real overhead loss, good O(n) value, as they say */
SELECT categoryid, productid, productname, unitprice
FROM (SELECT ROW_NUMBER() OVER(PARTITION BY categoryid
							   ORDER BY unitprice, productid) AS rownum,
	  categoryid, productid, productname, unitprice
	  FROM Production.Products) AS newDerivedTable
WHERE rownum <= 2;

/* This is called an inline derived able.  An external derived table is basically identical? No info */
/* Derived tables have the drawback that they can't be used in joins and whatnot without copypasting the code, 
   since the entire from statement is supposed to be operated on at once.  */


/* ALTERNATIVE - CTEs */
WITH ctetable AS
(
	SELECT
	  ROW_NUMBER() OVER(PARTITION BY categoryid
						ORDER BY unitprice, productid) AS rownum,
	  categoryid, productid, productname, unitprice
	FROM Production.Products
)
SELECT categoryid, productid, productname, unitprice
FROM ctetable
WHERE rownum <= 2;


WITH ctetable AS (),
ctetable2 AS ()
/* Query */


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
SELECT empid, mgrid, firstname,lastname, distance
FROM EmpsCTE;  /* page 126 */
/* The idea here is that the first part of the empsCTE returns employee #9.
   Then the second part is continuously called recursively, each result adding to the union */


/* IF YOU WANT to use the CTE or derived table in multiple queries, you need to use a view or inline table-valued function
Views don't take parameters, TVFs do */