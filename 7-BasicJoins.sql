USE Learn;

/* Cross Joins give you every combination between the two FROM tables */
SELECT Dept.department_name, Emp.employee_name, Emp.salary
FROM Dbo.Department AS Dept
	CROSS JOIN  dbo.Employee as Emp;

/* INNER JOINS you match results on a predicate, like if the keys match up between two tables */
SELECT
	Dept.department_name AS DepartmentName,
	Emp.employee_name AS EmployeeName,
	Emp.salary AS EmployeeSalary
FROM Dbo.Department AS Dept
	INNER JOIN  dbo.Employee as Emp
	ON Dept.department_id = Emp.department_id;

/* Remember that SQL creates unique indexes to track constraint columns, and these can be more quickly queried at times */
/* For INNER JOINS On is equivalent to WHERE, but in other joins, where is the normal filter, and on is the join predicate */

SELECT
	Dept.department_name AS DepartmentName,
	Emp.employee_name AS EmployeeName,
	Emp.salary AS EmployeeSalary
FROM Dbo.Department AS Dept
	INNER JOIN  dbo.Employee as Emp
	ON Dept.department_id = Emp.department_id
	AND Dept.department_id=1;

/* Outer Joins preserve every entry from the table (L or R) regardless of whether it matches the search predicate */
SELECT
	Dept.department_name AS DepartmentName,
	Emp.employee_name AS EmployeeName,
	Emp.salary AS EmployeeSalary
FROM Dbo.Department AS Dept
	LEFT OUTER JOIN  dbo.Employee as Emp
	ON Dept.department_id = Emp.department_id;

/* FULL OUTER JOIN preserves all itemson both side */
/* You can chain joins together, but remember that they'll work in an order (L to R) */
/* You can also break out joins , so one half of the join is the result of another join */

SELECT s.comanyName AS supplier, S.country,
	P.productId, P.productname, P.unitprice,
	C.categoryName
FROM Production.Suppliers AS S
	LEFT OUTER JOIN
	(Production.Products AS P
		INNER JOIN Production.Categories AS C
		ON C.categoryid = P.categoryid)
	ON S.supplierid = P.supplierid
WHERE S.country = N'Japan';

/* Left and RIGHT don't refer to the ON statements, but rather the order of table declarations */