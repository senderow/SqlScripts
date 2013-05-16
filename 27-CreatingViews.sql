
/* SCHEMABINDING forces users to update the view when the underlying tables are updated.
	WITH CHECK OPTION applies if your view uses filters, in which case, it prevents an update that would make the row disappear from the view
	WITH ENCRYPTION hides the sql used to create the view, so people can't figure out what the select query it is using is
	WITH VIEW_METADATA returns the metadata of the view instead of the base table */

CREATE VIEW Sales.ViewName
	WITH SEECommentsForOptions
AS
SELECT normalquery 


/* Editing a view */
ALTER VIEW Sales.OrderTotalsByYear
SELECT *
FROM Sales.OrderTotalsByYear
ORDer BY shipregion;

/* IT is not recommended to update through a view, though it is possible, 
there are a lot of restrictions due to the many natures a view could be displaying data. */

/* There are such things as partitioned views for large tables.  See lecture link for more info */

