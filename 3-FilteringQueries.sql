/* Specifically refers to queries that use ON, WHERE and HAVING */
USE AdventureWorks2012;

/* You can use expressions in a WHERE statement */
SELECT BusinessEntityID, LoginID, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus = N'S';

/* <> statements do not include NULLS, and NULLS are considered unknowns */
SELECT BusinessEntityID, LoginID, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus <> N'S';

/* To handle NULLS, explicitly include them */
SELECT BusinessEntityID, LoginID, HireDate, MaritalStatus
FROM HumanResources.Employee
WHERE MaritalStatus <> N'S'
	OR MaritalStatus IS NULL;

