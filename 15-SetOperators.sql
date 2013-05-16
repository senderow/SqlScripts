/* UNION, UNION ALL, INTERSECT, EXCEPT */

/* Column #s and types must be the same, null == null --> true, column names will be the same as first query */

/* Union has an implicit DISTINCT operator, hence the existence of UNION ALL */
SELECT columnName, columnName2
FROM databaseName

UNION

SELECT columnName, columnName2
FROM databaseName;