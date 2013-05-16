/* Filtering with  TOP and OFFSET-FETCH */

SELECT TOP(3) id, firstname, lastname
FROM sSales.Orders
ORDER BY orderdate DESC;

SELECT TOP(1) PERCENT id, firstname
FROM tablename
ORDER BY name DESC;

/* If your orderby does not guaranteed that the first X results are distinct */
SELECT TOP(5) WITH TIES id, name
FROM tablename
ORDER BY id;

SELECT id
FROM SALES.Orders
ORDER BY id desc
OFFSET 50 ROWS FETCH NEXT 25 ROWS ONLY; /* gets rows 50-75 */

SELECT id
FROM Sales.Orders
ORDER BY orderdate DESC
OFFSET 50 ROWS; /* return rows 51 through end */

/* To Mimic Top */
SELECT id
FROM Sales.Orders
ORDER BY (SELECT NULL)
OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY;



