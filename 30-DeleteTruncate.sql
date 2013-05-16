UPDATE Sales.MyOrderDetails
	SET discount += .05
WHERE orderid = 10251;

/* When updating with joins, be careful that the join is fully deterministic, or not everything will update */
UPDATE OD
	SET OD.discount += .05
	FROM Sales.MyCustomers AS C
		INNER JOIN Sales.MyOrders AS O
			ON C.custid = O.custid
		INNER JOIN Sales.MyOrderDetails AS OD
			ON O.orderid = OD.orderid
	WHERE C.country = N'Norway';

DELETE FROM tablename
WHERE something;


/* Truncate doesn't log as much as delete.  Truncate doesn't take a predicate.  Truncate can't handle foreign keys pointing to the table. */
TRUNCATE TABLE sales.MyOrderDetails;

DELETE FROM O
FROM Sales.MyOrders AS O
	INNER JOIN Sales.MyCustomers AS C
		ON O.custid = C.custid
WHERE C.Country = N'USA';

