USE TSQL2012;

/* Ex 1 - Get the number of orders per spanish customer */

/* Get spanish customers */
SELECT *
FROM Sales.Customers
WHERE country = N'Spain';

/* Get orders */
SELECT *
FROM Sales.Orders;

/* GEt num orders per spanish customer */
SELECT cust.contactname, Count(*) AS numOrders
FROM Sales.Customers AS cust
	INNER JOIN Sales.Orders AS Ord
	ON cust.custid = Ord.custid
	AND cust.country = N'Spain'
GROUP BY cust.custid, cust.contactname;

/* Ex 2 - Add the customer city information to the query output */
SELECT cust.contactname, Count(*) AS numOrders, cust.city
FROM Sales.Customers AS cust
	INNER JOIN Sales.Orders AS Ord
	ON cust.custid = Ord.custid
	AND cust.country = N'Spain'
GROUP BY cust.custid, cust.contactname, cust.city;


/* Ex 3 - 



