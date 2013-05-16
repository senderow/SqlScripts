/* Filtering with  TOP and OFFSET-FETCH */
Use AdventureWorks2012;

SELECT TOP(3) BusinessEntityID, FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY Title DESC;

SELECT TOP(1) PERCENT BusinessEntityID,  FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY Title DESC;

/* If your orderby does not guaranteed that the first X results are distinct */
SELECT TOP(5) WITH TIES BusinessEntityID,  FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY BusinessEntityID;

SELECT BusinessEntityID,  FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY FullName desc
OFFSET 50 ROWS FETCH NEXT 25 ROWS ONLY; /* gets rows 50-75 */

SELECT BusinessEntityID, FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY FullName DESC
OFFSET 50 ROWS; /* return rows 51 through end */

/* To Mimic Top */
SELECT BusinessEntityID, FirstName +N' ' + LastName AS FullName, Title
FROM Person.Person
ORDER BY (SELECT NULL)
OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY;
