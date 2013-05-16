CREATE TABLE

/* OR */

/* SELECT INTO Creates a table with the output of the query */

CREATE TABLE schemaName.tablename(
	columnName INT IDENTITY(1,1) NOT NULL,
	columnname2 NVARCHAR(12) NOT NULL)
GO

/* Schema names are basically the same thing as namespaces, except you can defined permissions to
	what users have access to what schema names */

/* You can make computed columns */
CREATE TABLE Sales.OrderDetails(
	orderid INT NOT NULL,
	initialcost AS unitprice * qty);
GO

/* For row or page compression, see http://msdn.microsoft.com/en-us/library/cc280574.aspx */