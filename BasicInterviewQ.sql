/* I want to get the two cheapest products sold by companies where we buy from less than 3 companies in that country */

/* Get all the suppliers */
SELECT suppliers.companyname, suppliers.contactname, suppliers.supplierid
FROM Production.Suppliers AS suppliers;

/* Gets all the products */
SELECT prod.productname, prod.unitprice, prod.supplierid
FROM Production.Products AS prod;

/* Gets all of the products, and their suppliers */
SELECT supp.companyname, supp.contactname, prod.productname, prod.unitprice
FROM Production.Products AS Prod
	INNER JOIN Production.Suppliers AS Supp
	ON Prod.supplierid = supp.supplierid;

/* Gets the two cheapest products from each supplier */
SELECT supp.companyname, supp.contactname, prod.productname, prod.unitprice
FROM Production.Suppliers AS Supp
	CROSS APPLY (
		SELECT prod.productname, prod.unitprice
		FROM Production.Products AS Prod
		WHERE Prod.supplierid = supp.supplierid
		ORDER BY Prod.unitprice ASC
		OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY
		) AS prod

/* Get the number of suppliers per country */
SELECT Supp.companyname, Supp.country, COUNT(*) OVER(PARTITION BY Supp.country) as Cnt
FROM Production.Suppliers AS Supp
ORDER BY Cnt, Supp.country;

/* Gets the two cheapest products from suppliers where we are buying from <3 companies in that country */
WITH ReturnSuppliersWithCountryCount
AS
(
	SELECT Supp.*, COUNT(*) OVER(PARTITION BY Supp.country) as Cnt
	FROM Production.Suppliers AS Supp
)
SELECT Suppliers.companyname, prod.productname, prod.unitprice, Suppliers.country, Suppliers.Cnt
FROM ReturnSuppliersWithCountryCount AS Suppliers
	CROSS APPLY (
		SELECT prod.productname, prod.unitprice
		FROM Production.Products AS Prod
		WHERE Prod.supplierid = Suppliers.supplierid
		ORDER BY Prod.unitprice ASC
		OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY
		) AS prod
WHERE Suppliers.Cnt < 2;