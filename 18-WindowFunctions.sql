/* Window functions are the same as the grouping functions (often, exactly the same, such as Count), 
but are used on rows, not groups.  Can only be used in SELECT and ORDER BY statements.  For example: */
USE TSQL2012;

SELECT Supp.companyname, COUNT(*) OVER(PARTITION BY Supp.country) as Cnt,
		COUNT(*) OVER() as GrandTotal
FROM Production.Suppliers AS Supp;

/* This totals ever row */
SELECT custid, orderid, orderdate, val
	SUM(val) OVER(PARTITION BY custid
				   ORDER BY orderdate, orderid
				   ROWS BETWEEN UNBOUNDED PRECEDING
				   AND CURRENT ROW) AS runningtotal
FROM [Sales].[OrderValues];

/* Options include UNBOUNDED PRECEDING or FOLLOWING (ie beginning or end of partition)
   CURRENT ROW
   <n> ROWS PRECEDING or FOLLOWING */

/* Window Ranking Functions include ROW_NUMBER()
	RANK(), DENSE_RANK(), NTILE() 
All do as expected, except NTILE, which will assign a number to split the set into groups */
SELECT custid, val,
	ROW_NUMBER() OVER(ORDER BY val) AS rownum,
	RANK() OVER(ORDER BY val) as rank
FROM Sales.OrderValues;


/* There is also LAG, LEAD, FIRST_VALUE, and LAST_VALUE */
SELECT custid, val,
	LAG(val, 2) OVER(PARTITION BY custid
					 ORDER BY overdate, orderid) AS prev_val
FROM Sales.OrderValues;


SELECT custid, orderd, val,
	FIRST_VALUE(val) OVER(PARTITION BY custid
						  ORDER BY orderdate, orderid
						  ROWS BETWEEN UNBOUNDED PRECEDING
							AND CURRENT ROW) as first_val
FROM Sales.OrderValues;
