/* Lets say you wanted to return the two cheapest products sold by a supplier */
USE TSQL2012;

/* There are two Japanese suppliers in the Prod.Suppliers table.  Supplier ids are 4 and 6 */
SELECT contactname, supplierid 
FROM Production.Suppliers
WHERE country = N'Japan';

/* There are 6 products we buy from Japan, product costs are 10 31 97, 6 15 23 */
SELECT contactname, Prod.productname, Prod.unitprice, Prod.productid
FROM Production.Suppliers AS Supp
	INNER JOIN Production.Products AS Prod
	ON Supp.supplierid = Prod.supplierid
WHERE Supp.country = N'Japan';

/* The two cheapest are 6$ and 10$ */
SELECT productid, productname, unitprice, supplierid
FROM Production.Products
WHERE supplierid = 4 OR supplierid = 6
ORDER BY unitprice
OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY;

/* But now you want to return the two cheapest from every japanese supplier, without using a cursor */
SELECT Supp.supplierid, Supp.contactname AS contactname, A.*
FROM Production.Suppliers AS Supp
	CROSS APPLY (SELECT productid, productname, unitprice
				FROM Production.Products AS Prod
				WHERE Prod.supplierid = Supp.supplierid
				ORDER BY unitprice, productid
				OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY) AS A
WHERE Supp.country = N'Japan';

/* so basically, cross applys are like doing a foreach, but without an actual loop behind the scenes */


/* OUTER APPLY - is the same thing, but returns rows if the () section returns null for that value */
SELECT Supp.supplierid, Supp.companyname AS contactname, A.*
FROM Production.Suppliers AS Supp
	OUTER APPLY (SELECT productid, productname, unitprice
				FROM Production.Products AS Prod
				WHERE Prod.supplierid = Supp.supplierid
				ORDER BY unitprice, productid
				OFFSET 0 ROWS FETCH FIRST 2 ROWS ONLY) AS A
WHERE Supp.country = N'Japan';
