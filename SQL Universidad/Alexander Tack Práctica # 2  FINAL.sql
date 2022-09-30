USE bd_Proyecto_Final
go

-- Alexander Tack
		select a.Nombre1
		from [dbo].[tblClientes] a
		go


		select distinct b.Apellido1
		from [dbo].[tblClientes] b
		go



		select d.Nombre2, d.Apellido2
		from [dbo].[tblClientes] d
		go


		select g.Nombre1, g.Nombre2, g.Apellido1, g.Apellido2
		from [dbo].[tblClientes] g
		where g.Nombre1 = 'Gomez' or g.Apellido1 = 'Tack'
		go


	
		select h.TipoCliente
		from [dbo].[tblClientes] h
		where h.TipoCliente > (1)
		go


		select i.Nombre1
		from [dbo].[tblClientes] i
		where i.Nombre1 between 5 and 10
		go



