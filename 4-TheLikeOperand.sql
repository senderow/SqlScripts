use AdventureWorks2012;

SELECT PersonType, Title, FirstName, LastName
From Person.Person
WHERE FirstName LIKE N'_a%'; /* Where the second character is an a, and the string continues afterward */

SELECT PersonType, Title, FirstName, LastName
From Person.Person
WHERE FirstName LIKE N'[^0-9]%';	/* Where the first letter is not (^) a number */

/* ! escapes, so !% will actually look for the % symbol */
