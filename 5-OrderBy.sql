USE AdventureWorks2012;

SELECT PersonType, Title, FirstName, LastName
From Person.Person
WHERE FirstName LIKE N'[^0-9]%'
ORDER BY Title ASC, FirstName DESC;


/* REMEMBER DISTINCT and GROUP BY return single rows per value, 
   so unless you're ordering by one of the distinct or group column values
   it will be an invalid statement */

/* because order by is a cursoe, it is expensive */