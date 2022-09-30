USE [master]
go

--Elimina la tabla que se va a crear si es que existe.
IF EXISTS(SELECT * from sys.databases WHERE name='Bd_AlexanderTack_P03_01')  
BEGIN  
    DROP DATABASE Bd_AlexanderTack_P03_01;  
	-- ALTER TABLE significa modificar tabla
END  


--Crea una nueva tabla llamada con el nombre q pongo
CREATE DATABASE Bd_AlexanderTack_P03_01



use Bd_AlexanderTack_P03_01
go


-- Colocar prefijo del nombre y apellido a cada tabla
CREATE TABLE "AT_Employees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" "image" NULL ,
	"Notes" "ntext" NULL ,
	"ReportsTo" "int" NULL ,
	"PhotoPath" nvarchar (255) NULL ,
	CONSTRAINT "pk_AT_Employees" PRIMARY KEY  CLUSTERED --Colocar prefijo del nombre y apellido a cada llave primaria
	(
		"EmployeeID"
	),
	CONSTRAINT "fk_AT_Employees_Employees" FOREIGN KEY --Colocar prefijo del nombre y apellido a cada llave secundaria
	(
		"ReportsTo"        -- ESTO DEBIO HABER SIDO EMPLOYEESID 
	) REFERENCES "dbo"."AT_Employees" (          -- referencias
		"EmployeeID"
	),
	CONSTRAINT "ck_AT_Birthdate" CHECK (BirthDate < getdate())
)
GO


CREATE TABLE "AT_Categories" (
	"CategoryID" "int" IDENTITY (1, 1) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" "ntext" NULL ,
	"Picture" "image" NULL ,
	CONSTRAINT "pk_AT_Categories" PRIMARY KEY  CLUSTERED 
	(
		"CategoryID"
	)
)
GO

CREATE TABLE "AT_Customers" (
	"CustomerID" nchar (5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	CONSTRAINT "pk_AT_Customers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)
GO

CREATE TABLE "AT_Shippers" (
	"ShipperID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Phone" nvarchar (24) NULL ,
	CONSTRAINT "pk_AT_Shippers" PRIMARY KEY  CLUSTERED 
	(
		"ShipperID"
	)
)
GO

CREATE TABLE "AT_Suppliers" (
	"SupplierID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	"HomePage" "ntext" NULL ,
	CONSTRAINT "pk_AT_Suppliers" PRIMARY KEY  CLUSTERED 
	(
		"SupplierID"
	)
)
GO


CREATE TABLE "AT_Orders" (
	"OrderID" "int" IDENTITY (1, 1) NOT NULL ,
	"CustomerID" nchar (5) NULL ,
	"EmployeeID" "int" NULL ,
	"OrderDate" "datetime" NULL ,
	"RequiredDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipVia" "int" NULL ,
	"Freight" "money" NULL CONSTRAINT "df_AT_Orders_Freight" DEFAULT (0),
	"ShipName" nvarchar (40) NULL ,
	"ShipAddress" nvarchar (60) NULL ,
	"ShipCity" nvarchar (15) NULL ,
	"ShipRegion" nvarchar (15) NULL ,
	"ShipPostalCode" nvarchar (10) NULL ,
	"ShipCountry" nvarchar (15) NULL ,
	CONSTRAINT "pk_AT_Orders" PRIMARY KEY  CLUSTERED  -- llave primaria
	(
		"OrderID"
	),
	CONSTRAINT "fk_AT_Orders_Customers" FOREIGN KEY  -- llav foranea
	(
		"CustomerID"
	) REFERENCES "dbo"."AT_Customers" (
		"CustomerID"
	),
	CONSTRAINT "fk_AT_Orders_Employees" FOREIGN KEY -- llave foranea
	(
		"EmployeeID"
	) REFERENCES "dbo"."AT_Employees" (       -- referencia a empleados
		"EmployeeID"
	),
	CONSTRAINT "fk_AT_Orders_Shippers" FOREIGN KEY     -- llave foranea
	(
		"ShipVia"     -- esto devio de hacer shipperID ....? pregunta    
	) REFERENCES "dbo"."AT_Shippers" (    -- referencia
		"ShipperID"
	)
)
GO

CREATE TABLE "AT_Products" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"SupplierID" "int" NULL ,
	"CategoryID" "int" NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" "money" NULL CONSTRAINT "df_AT_Products_UnitPrice" DEFAULT (0),
	"UnitsInStock" "smallint" NULL CONSTRAINT "df_AT_Products_UnitsInStock" DEFAULT (0),
	"UnitsOnOrder" "smallint" NULL CONSTRAINT "df_AT_Products_UnitsOnOrder" DEFAULT (0),
	"ReorderLevel" "smallint" NULL CONSTRAINT "df_AT_Products_ReorderLevel" DEFAULT (0),
	"Discontinued" "bit" NOT NULL CONSTRAINT "df_AT_Products_Discontinued" DEFAULT (0),
	CONSTRAINT "pk_AT_Products" PRIMARY KEY  CLUSTERED -- llave primaria
	(
		"ProductID"
	),



	CONSTRAINT "fk_AT_Products_Categories" FOREIGN KEY  -- llave foranea d producto a categorias
	(
		"CategoryID"
	) REFERENCES "dbo"."AT_Categories" (    -- haciendo referencia a categorias
		"CategoryID"
	),



	CONSTRAINT "fk_AT_Products_Suppliers" FOREIGN KEY  --llave foranea de producto a provedores
	(
		"SupplierID"
	) REFERENCES "dbo"."AT_Suppliers" (   -- haciendo referencia a proveedores
		"SupplierID"
	),


	CONSTRAINT "ck_AT_Products_UnitPrice" CHECK (UnitPrice >= 0),
	CONSTRAINT "ck_AT_ReorderLevel" CHECK (ReorderLevel >= 0),
	CONSTRAINT "ck_AT_UnitsInStock" CHECK (UnitsInStock >= 0),
	CONSTRAINT "ck_AT_UnitsOnOrder" CHECK (UnitsOnOrder >= 0)
)
GO

CREATE TABLE "AT_OrderDetails" (
	"OrderID" "int" NOT NULL ,
	"ProductID" "int" NOT NULL ,
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_Order_Details_UnitPrice" DEFAULT (0),
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_Order_Details_Quantity" DEFAULT (1),
	"Discount" "real" NOT NULL CONSTRAINT "DF_Order_Details_Discount" DEFAULT (0),
	CONSTRAINT "pk_AT_Order_Details" PRIMARY KEY  CLUSTERED -- llaves primaria
	(
		"OrderID",
		"ProductID"
	),



	CONSTRAINT "fk_AT_Order_Details_Orders" FOREIGN KEY  -- llaves foraneas 
	(
		"OrderID"
	) REFERENCES "dbo"."AT_Orders" (    -- hacen referencia Ordenes ( ordenID) 
		"OrderID"
	),


	CONSTRAINT "fk_AT_Order_Details_Products" FOREIGN KEY 
	(
		"ProductID"
	) REFERENCES "dbo"."AT_Products" (
		"ProductID"
	),

	CONSTRAINT "CK_Discount" CHECK (Discount >= 0 and (Discount <= 1)),
	CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
	CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
)
GO


------------------------------------------------------------------


CREATE TABLE "AT_CustomerCustomerDemo"(         -- tabla

	"CustomerID" nchar (5) NOT NULL,
	"CustomerTypeID" nchar (10) NOT NULL

CONSTRAINT "pk_AT_CustomerCustomerDemo" PRIMARY KEY  NONCLUSTERED --llave primaria
	(
		"CustomerID",
		"CustomerTypeID"
	),	

CONSTRAINT "fk_AT_CustomerCustomerDemo" FOREIGN KEY  -- llave secundaria
	(
		"CustomerTypeID"
	) REFERENCES "dbo"."AT_CustomerDemographics" (  -- haciendo referencia a customer demografhics
		"CustomerTypeID"
	),


CONSTRAINT "fk_AT_CustomerCustomerDemo_Customers" FOREIGN KEY  -- llave secundaria
	(
		"CustomerID"
	) REFERENCES "dbo"."AT_Customers" (    --- haciendo referencia a clientes
		"CustomerID"
	)

)
GO


CREATE TABLE "AT_CustomerDemographics"(

	"CustomerTypeID" nchar (10) NOT NULL ,
	"CustomerDesc" ntext NULL

	CONSTRAINT "pk_AT_CustomerDemographics" PRIMARY KEY  NONCLUSTERED 
	(
		"CustomerTypeID"
	)
)	
GO



	CREATE TABLE "AT_Region" (
	
	"RegionID" int NOT NULL ,
	"RegionDescription" nchar (50) NOT NULL 
    
	CONSTRAINT "pk_AT_Region" PRIMARY KEY  NONCLUSTERED 
	(
		"RegionID"
	)

)	
GO


CREATE TABLE "AT_Territories" (       --- tabla
    "TerritoryID" nvarchar (20) NOT NULL ,
	"TerritoryDescription" nchar (50) NOT NULL ,
    "RegionID" int NOT NULL

	CONSTRAINT "pk_AT_Territories" PRIMARY KEY  NONCLUSTERED  -- llave primaria
	(
		"TerritoryID"
	),


   CONSTRAINT "fk_AT_Territories_Region" FOREIGN KEY -- llave secundaria
	(
		"RegionID"
	) REFERENCES "dbo"."AT_Region" (  -- que hace referencia a region
		"RegionID"
	)
)
GO



CREATE TABLE "AT_EmployeeTerritories" (
	"EmployeeID" int NOT NULL,
	"TerritoryID" nvarchar (20) NOT NULL 
	

	CONSTRAINT "pk_AT_EmployeeTerritories" PRIMARY KEY  NONCLUSTERED 
	(
		"EmployeeID",
		"TerritoryID"
	),


	CONSTRAINT "fk_AT_EmployeeTerritories_Employees" FOREIGN KEY 
	(
		"EmployeeID"
	) REFERENCES "dbo"."AT_Employees" (
		"EmployeeID"
	),

	CONSTRAINT "fk_AT_EmployeeTerritories_Territories" FOREIGN KEY 
	(
		"TerritoryID"
	) REFERENCES "dbo"."AT_Territories" (
		"TerritoryID"
	)

)
GO
