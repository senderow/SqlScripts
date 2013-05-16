USE TSQL2012;

/* Joins, Exercise 1 */
SELECT Cust.contactname, Cust.custId AS customerId, Orders.custid AS OrderCustId, Orders.orderid AS OrderId
FROM Sales.Customers AS Cust
	INNER JOIN Sales.Orders AS Orders
	ON Orders.custid = Cust.custid;

/* Joins, Exercise 2 */
SELECT Cust.companyname, Cust.custId AS customerId, Orders.custid AS OrderCustId, Orders.orderdate
FROM Sales.Customers AS Cust
	LEFT OUTER JOIN Sales.Orders AS Orders
	ON Cust.custid = Orders.custid;

/* Joins, Exercise 3 */
SELECT Cust.companyname, Cust.custId AS customerId, Orders.custid AS OrderCustId, Orders.orderdate
FROM Sales.Customers AS Cust
	LEFT OUTER JOIN Sales.Orders AS Orders
	ON Cust.custid = Orders.custid
WHERE Orders.orderdate IS NULL;

/* Joins, Exercise 4 - Return all customers, also return all orders from in feb 2008 */
SELECT Cust.companyname, Cust.custId AS customerId, Orders.custid AS OrderCustId, Orders.orderdate
FROM Sales.Customers AS Cust
	LEFT OUTER JOIN Sales.Orders AS Orders
	ON Orders.custid = Cust.custid
	AND Orders.orderdate >= '20080201' /* If we had put this comparision into WHERE, we would have lost all NULLS */
	AND Orders.orderdate < '20080301';