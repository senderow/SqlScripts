USE TSQL2012;

/* Return the cheapest of each product */
WITH catMin AS 
(
	SELECT categoryid, MIN(unitprice) AS minPrice
	FROM Production.Products
	GROUP BY categoryid
)
SELECT productname, Prod.categoryid, unitprice
FROM Production.Products AS Prod
	INNER JOIN catMin AS minValue
	ON minValue.categoryid = Prod.categoryid
	AND unitprice = minValue.minPrice;
	

/* Exercise 2 - Create an Inline TVF that takes a supplier Id and a number, and returns the number of products with the lowest prices for that given supplier.
  If two items tie, use the product id as the tiebreaker */
IF OBJECT_ID('Production.GetSuppliersCheapestProducts', 'IF') IS NOT NULL DROP FUNCTION Production.GetSuppliersCheapestProducts; 
GO
CREATE FUNCTION Production.GetSuppliersCheapestProducts(@supplierId AS INT, @n AS BIGINT)
RETURNS TABLE
AS

RETURN
	SELECT * 
	FROM Production.Products AS Prod
	WHERE Prod.supplierid = @supplierId
	ORDER BY Prod.unitprice ASC, productid
	OFFSET 0 ROWS FETCH FIRST @n ROWS ONLY;
GO

/* Test */
SELECT *
FROM Production.GetSuppliersCheapestProducts(1, 2)

/* Exercise 3 - Using the prev function, return per each supplier from Japan the two products
   with the lowest pricees */

SELECT Supp.companyname, Prods.productname, Prods.unitprice
FROM Production.Suppliers AS Supp
	OUTER APPLY(SELECT *
				FROM Production.GetSuppliersCheapestProducts(Supp.supplierid, 2)
	) AS Prods
WHERE Supp.country = N'Japan'
ORDER BY Supp.companyname;

IF OBJECT_ID('Production.GetSuppliersCheapestProducts', 'IF') IS NOT NULL DROP FUNCTION Production.GetSuppliersCheapestProducts; 