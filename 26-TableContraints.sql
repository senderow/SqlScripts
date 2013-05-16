/* Sets the column PK_Categories as the primary key, using the value in categoryid */
CREATE TABLE Production.Categories
(
	categoryid INT NOT NULL IDENTITY,
	categoryname NVARCHAR(13) NOT NULL,
	CONSTRAINT PK_Categories PRIMARY KEY(categoryid)
);

/* Creates a unique index with the same name as the constraint */
ALTER TABLE Production.Categories
	ADD CONSTRAINT UC_Categories UNIQUE(categoryname);
GO

/* See existing constraints in the db */
SELECT *
FROM sys.key_constraints
WHERE type = 'PK' OR type = 'UQ';


ALTER TABLE Production.Products WITH CHECK
	ADD CONSTRAINT FK_Product_Categories FOREIGN KEY(categoryid)
	REFERENCES Production.Categories(categoryid);
GO

/* You can create checks to ensure no improper data is entered.  to make sure
    rows aren't updated in an improper fashion, look into triggers */
ALTER TABLE Production.Products WITH CHECK /* With Check checks if current table data meets this requirement */
	ADD CONSTRAINT CHK_Products_unitprice
	CHECK (unitprice >= 0);
GO


/* Lastly, setting default values */
CREATE TABLE Production.Products
(
	discontinued BIT NOT NULL
		CONSTRAINT DFT_Products_discontinue DEFAULT(0)
);