--  Alexander Tack / 8-820-1017
--  Base de Datos


--  TAREA EN LA BASE DE DATOS (PUBS) HACER LOS 4 PROSEDIMIENTOS DE TRIGUER PARA CADA TABLA DE LA BASE DE DATOS


use pubs
go

------------------------------------------------------------------


--INSERT TRIGGER TABLA DISCOUNTS

CREATE TRIGGER [dbo].[trg_InsertarDiscounts]

	ON [dbo].[discounts]
	for INSERT

AS
BEGIN

	SET NOCOUNT ON

	INSERT INTO [dbo].[discountsbit]
	([discounttype],[stor_id],[lowqty],[highqty],[discount],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[discounttype],i.[stor_id],i.[lowqty],i.[highqty],i.[discount],
		getdate(),host_name(),suser_sname(),'I'
		from inserted i
	

END
GO



----------------------------------------------------------------------




--DELETE TRIGGER TABLA DISCOUNTS

CREATE TRIGGER [dbo].[trg_DeleteDiscounts]

	ON [dbo].[discounts]
	for delete

AS
BEGIN

	SET NOCOUNT ON

	INSERT INTO [dbo].[discountsbit]
	([discounttype],[stor_id],[lowqty],[highqty],[discount],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[discounttype],i.[stor_id],i.[lowqty],i.[highqty],i.[discount],
		getdate(),host_name(),suser_sname(),'D'
		from deleted i

END
GO


---------------------------------------------------------------------------


--UPDATE TRIGGER TABLA DISCOUNTS


CREATE TRIGGER [dbo].[trg_updateDiscounts]

	ON [dbo].[discounts]
	for update

AS
BEGIN

	SET NOCOUNT ON
	
	INSERT INTO [dbo].[discountsbit]
	([discounttype],[stor_id],[lowqty],[highqty],[discount],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[discounttype],i.[stor_id],i.[lowqty],i.[highqty],i.[discount],
		getdate(),host_name(),suser_sname(),'UI'
		from inserted i
	

	INSERT INTO [dbo].[discountsbit]
	([discounttype],[stor_id],[lowqty],[highqty],[discount],
		[exec_date],[exec_host],[exec_user],[exec_accion]
		)
	select
	i.[discounttype],i.[stor_id],i.[lowqty],i.[highqty],i.[discount],
		getdate(),host_name(),suser_sname(),'UD'
		from deleted i
END
GO