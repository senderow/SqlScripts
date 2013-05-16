
/* Always ORDER BY a column name, not a column number.  This is called a cursor. */

/* Standard SQL typing order:
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
FILTERS

Standard SQL Logical Order
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY 
FILTERS */

/* Group BY returns one row per grouping

ALIASes created inthe select statement are only visible after the select statements

TOP, OFFSET-FETCH and DISTINCT are logically last in the Order of Operations

SELECT CAST('abc' AS INT) does exactly what you think
SELECT TRY_CAST('abc' as INT) returns NULL instead of an exception if a problem occurs

SELECT whatever,
    CASE
	    WHEN columnName booleanOp something THEN VALUE
		WHEN columnName booleanOp diffValue THEN VALUE
		ELSE VALUE
	END AS newDisplayName
FROM Production.Prices;

UNIQUEIDENTIFIER columns are random guides.

Research the terms clustered index, indexes on multiple platforms, 
sequential vs non-sequential key types result in paging and page splits and index fragmentation

unicode values are denoted by N'value'