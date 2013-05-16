SELECT COUNT(*) AS numorders
FROM Sales.Orders;

/* numorders
  ----------
  850          */

/* Returns the count for each shipper id */
SELECT shipperid, COUNT(*) as numorders
FROM Sales.Orders
GROUP BY shipperid;

/* will have a count column for every combination of shipperid and year in column */
SELECT shipperid, YEAR(shippeddate) as shippedyear, COUNT(*) as numorders
FROM Sales.Orders
GROUP BY shipperid, YEAR(shippeddate);

/* If you only wanted the previous query to return some combinations of year and shipperid
   You can't use WHERE because that works on ROWS.  You need something that works on groups, 
   That's HAVING */
SELECT shipperid, YEAR(shippeddate) as shippedyear, COUNT(*) as numorders
FROM Sales.Orders
WHERE shippeddate IS NOT NULL
GROUP BY shipperid, YEAR(shippeddate)
HAVING COUNT(*) < 100;

/* grouped functions include COUNT(), SUM, aVG, MIN, MAX, etc */
/* COUNT(*) includes nulls.  COUNT(columnName) ignores nulls.  COUNT(DISTINCT columnName) also exists */

/* Pages 158-160 it explains grouping sets in the groupby statement.  It seems they could be
useful if the original query is going to take a particularly long amount of time. */

