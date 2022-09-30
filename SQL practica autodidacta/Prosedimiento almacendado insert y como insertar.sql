-- prosedimiento almcenado
-- conjunto de consulas que se ejecuta en una sola solicitud
-- si se crea un prosedimeino almacenado para insertar informacion 
-- especifica, e evita que se hagan inyecciones de SQL, mejora la segurida de la BD
-- con esto solo permitimos que los usuarios llamen a un prosedimiento
--y consulten ciertas tabls y no tada la bd



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE ProcedureInsert

	
	@Identificacion varchar(45),
	@Nombre1 varchar (45),
	@Nombre2 varchar (45),
	@Apellido1 varchar (45),
	@Apellido2 varchar (45),
    @TipoCliente int,
	@Saldo decimal

AS
BEGIN
-- validamos si existe usuario
-- validamos si existe con la misma cedula de identificacion
if ((select count(*) from [tblClientes] where Identificacion = @Identificacion)>0)
begin
	select 0  -- me valida que que ya existe en la bd
end
	else
begin
		--declare @Identificacion varchar (45) = @@IDENTITY
	
			insert into [tblClientes] 
				(
				
				Identificacion,
				Nombre1,
				Nombre2,
				Apellido1,
				Apellido2,
				TipoCliente,
				Saldo
				)

			values
				(
				@Identificacion,
				@Nombre1,
				@Nombre2,
				@Apellido1,
				@Apellido2,
				@TipoCliente,
				@Saldo
				)
				select @nombre1, @Apellido1,@identificacion;  -- me confirma los datos insertados
end


END
GO


-- llamando el prosedimieto almacenado para ingresarle datos 
exec ProcedureInsert '8-000-0009', 'Alez', 'Leo', 'Rivera', 'Gonza', '1','200';






