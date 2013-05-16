IF OBJECT_ID('Sales.GetCustomerOrders', 'P') IS NOT NULL DROP PROC Sales.GetCustomerOrders;
GO

CREATE PROC Sales.GetCustomerOrders
	@custid AS INT,
	@orderdate AS DATETIME = '19000101',
	@numrows AS INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT orderid, custid
	FROM Sales.Orders
	WHERE custid = @custid
		AND orderdate >= @orderdate
	SET @numrows = @@ROWCOUNT
	RETURN;
END
GO



/* ---- */
DECLARE @var AS INT;
EXEC Sales.GetCustomerOrders
	@custid = 37,
	@orderdate = '20070401'
	@numrows = @rowsreturns OUTPUT
SELECT @rowsreturned AS "Rows Returned";
GO