USE TSQL2012;

/* The IN keyword can be used */
SELECT columnName
FROM table
WHERE columnName2 IN
	(SELECT columnName
	 FROM table
	 WHERE something);


/* If you are sure your subquery will return 1 result or NULL, you can use = */
SELECT columnName
FROM tableName
WHERE columnName = 
	(SELECT MIN(columnName) /* If sub returns NULL, will throw runtime error */
	FROM tableName);


/* Subqueries do not have to be self-contained */
/* Return the rows where that item is the min price for items of its category */
SELECT categoryid, productid, productname, unitprice
FROM Production.Products as Prod
WHERE unitprice = 
	(SELECT MIN(unitprice)
	FROM Production.Products as Prod2
	WHERE Prod2.categoryid = Prod.categoryid);

/* EXISTS returns true or false, here we display only results where the customer ordered something on deb12, 2007 */
SELECT Cust.companyname, Cust.custId AS customerId
FROM Sales.Customers AS Cust
WHERE EXISTS
	(SELECT *
	FROM Sales.Orders AS Orders
	WHERE Orders.custid = Cust.custid
	AND Orders.orderdate = '20070212');

/* Or the inverse */
SELECT Cust.companyname, Cust.custId AS customerId
FROM Sales.Customers AS Cust
WHERE NOT EXISTS
	(SELECT *
	FROM Sales.Orders AS Orders
	WHERE Orders.custid = Cust.custid
	AND Orders.orderdate = '20070212');