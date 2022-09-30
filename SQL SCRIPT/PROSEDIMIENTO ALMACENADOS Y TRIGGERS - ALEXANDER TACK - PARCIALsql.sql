--  Alexander Tack / 8-820-1017
--  Base de Datos


-- (NORTHWIND) HACER LOS 4 PROSEDIMIENTOS DE TRIGUER Y PROSEDIMIENTO ALMACENADO PARA LA TABLA DE (SUPPLIERS).



-- TRIGGERS

--INSERT TRIGGER (TABLA SUPPLIERS)


Use Northwind
GO


CREATE TRIGGER [dbo].[trg_InsertarSuppliers]

	ON [dbo].[Suppliers]
	for INSERT         -- SI ALGUIEN INSERTA TE DA LOS DATOS NUEVOS QUE INSERTARON

AS
BEGIN

	SET NOCOUNT ON

	INSERT INTO [dbo].[Suppliersbit]
	([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[fax],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[CompanyName],i.[ContactName],i.[ContactTitle],i.[Address],i.[City],i.[Region],i.[PostalCode],i.[Country],i.[Phone],i.[fax],
		getdate(),host_name(),suser_sname(),'I'
		from inserted i
	

END
GO


----------------------------------------------------------------------




--DELETE TRIGGER (TABLA SUPPLIERS)

CREATE TRIGGER [dbo].[trg_DeleteSuppliers]

	ON [dbo].[Suppliers]        -- SI ALGUIEN BORRA TE DA LOS DATOS QUE BORRO 
	for delete

AS
BEGIN

	SET NOCOUNT ON

	INSERT INTO [dbo].[Suppliersbit]
	([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[fax],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	d.[CompanyName],d.[ContactName],d.[ContactTitle],d.[Address],d.[City],d.[Region],d.[PostalCode],d.[Country],d.[Phone],d.[fax],
		getdate(),host_name(),suser_sname(),'D'
		from deleted d

END
GO


---------------------------------------------------------------------------


--UPDATE TRIGGER (TABLA SUPPLIERS)


CREATE TRIGGER [dbo].[trg_updateSuppliers]

	ON [dbo].[Suppliers]
	for update            SI ALGUIEN ACTULIZA TE DA LOS DATO QUE ACTUALIZO

AS
BEGIN

	SET NOCOUNT ON
	
	INSERT INTO [dbo].[Suppliersbit]
	([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[fax],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[CompanyName],i.[ContactName],i.[ContactTitle],i.[Address],i.[City],i.[Region],i.[PostalCode],i.[Country],i.[Phone],i.[fax],
		getdate(),host_name(),suser_sname(),'UI'
		from inserted i
	

	INSERT INTO [dbo].[Suppliersbit]
	([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[fax],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[CompanyName],i.[ContactName],i.[ContactTitle],i.[Address],i.[City],i.[Region],i.[PostalCode],i.[Country],i.[Phone],i.[fax],
		getdate(),host_name(),suser_sname(),'UD'
		from deleted i
END
GO

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------



-- PROSEDIMIENTO ALMACENADO


--CREAR (TABLA SUPPLIERS)

CREATE PROCEDURE [dbo].[usp_InsertarSuppliers]
@SupplierID int OUTPUT,   
@CompanyName nvarchar (40),
@ContactName nvarchar (30),
@ContactTitle nvarchar (30),
@Address nvarchar (60),
@City nvarchar (15),
@Region nvarchar (15),
@PostalCode nvarchar(10),
@Country nvarchar (15),
@Phone nvarchar (24),
@Fax nvarchar (24),
@HomePage ntext

AS
BEGIN
  SET NOCOUNT ON   


	
	INSERT INTO [dbo].[Suppliers]
	([CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax],[HomePage]
	)
	VALUES
	(@CompanyName,@ContactName,@ContactTitle,@Address,@City,@Region,@PostalCode,@Country,@Phone,@Fax,@HomePage
	)
	SET @SupplierID  =  @@IDENTITY   

END
GO     


-------------------------------------------------------------------------------



-- BORRAR  (TABLA SUPPLIERS)

CREATE PROCEDURE [dbo].[usp_BorrarSuppliers]
@SupplierID int     


AS
BEGIN
  SET NOCOUNT ON    


	DELETE C
	FROM Suppliers C
	WHERE
        C.SupplierID = @SupplierID

	
END
GO     


------------------------------------------------------------------------------------


--UPDATE  TABLA DISCOUNTS

CREATE PROCEDURE [dbo].[usp_ActualizarDiscounts]
@SupplierID int,   
@CompanyName nvarchar (40),
@ContactName nvarchar (30),
@ContactTitle nvarchar (30),
@Address nvarchar (60),
@City nvarchar (15),
@Region nvarchar (15),
@PostalCode nvarchar(10),
@Country nvarchar (15),
@Phone nvarchar (24),
@Fax nvarchar (24),
@HomePage ntext

AS
BEGIN
  SET NOCOUNT ON    

	
	UPDATE c
	SET
	c.CompanyName = @CompanyName,
	c.ContactName = @ContactName,
	c.ContactTitle= @ContactTitle,
	c.Address = @Address,
	c.City = @City,
	c.Region = @Region,
	c.PostalCode = @PostalCode,
	c.Country = @Country,
	c.Phone = @Phone,
	c.Fax = @Fax,
	c.HomePage = @HomePage


	from [dbo].[Suppliers] c
	WHERE
	c.SupplierID = @SupplierID	

END
GO     


-------------------------------------------------------------------------------------

---LECTURA  (TABLA SUPPLIERS)

CREATE PROCEDURE [dbo].[usp_Leer_Suppliers_Porllaves]
@SupplierID int     

AS
BEGIN
  SET NOCOUNT ON    


	
	SELECT c.[SupplierID],c.[CompanyName],c.[ContactName],c.[ContactTitle],c.[Address],c.[City],c.[Region],c.[PostalCode],c.[Country],c.[Phone],c.[Fax],c.[HomePage]
	from Suppliers c
	where
	c.SupplierID = @SupplierID

END
GO    



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------