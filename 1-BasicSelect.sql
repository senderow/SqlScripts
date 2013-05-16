USE AdventureWorks2012;

/* when combining column names, always use an alias.  
Valid SQL columns always have header names. */
SELECT BusinessEntityID as ID
FROM HumanResources.Employee;

/* You can use the same name multiple times, but must alias */
SELECT BusinessEntityID AS ID1, BusinessEntityID AS ID2
from HumanResources.Employee;

/* Returns the number of employees */
SELECT COUNT(*) AS numEmployees
FROM HumanResources.Employee;