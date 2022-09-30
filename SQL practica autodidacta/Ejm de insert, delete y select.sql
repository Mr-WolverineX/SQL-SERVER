use basededatos;
go

create table Cliente
(
ID_Cliente int identity primary key,
Primer_Nombre varchar (20) not null,
Segundo_Nombre varchar (20) not null,
Primer_Apellido varchar (20) not null,
Segundo_Apellido varchar (20) not null,
Cedula varchar (20) not null,
Email varchar (50) not null,
)
go

insert into [dbo].Cliente
			([Primer_Nombre],[Segundo_Nombre], 
			 [Primer_Apellido],[Segundo_Apellido],
			 [Cedula],[Email])
values
			('Anel', 'leo', 'aprua', 'gonzalez', '8-924-0000', 'AnelGonz@hotmail.com');
go

insert into Cliente values ('Marion', 'Sebastian', 'Santo', 'Presi', '8-87-96', 'Marionaaa@hotmail.com');
go

insert into [dbo].Cliente
			([Primer_Nombre],[Segundo_Nombre], 
			 [Primer_Apellido],[Segundo_Apellido],
			 [Cedula],[Email])
values
			('Leonel', 'Martinez', 'Etrup','Lince', '9-987-1234', 'leonelm@hotmail.com');
go

insert into [dbo].Cliente
			([Primer_Nombre],[Segundo_Nombre], 
			 [Primer_Apellido],[Segundo_Apellido],
			 [Cedula],[Email])
values
			('Picilio', 'Martinez', 'Fonseca','Fonseca', '3-698-1014', 'fonsecafonseca@hotmail.com');
go

insert into [dbo].Cliente
			([Primer_Nombre],[Segundo_Nombre], 
			 [Primer_Apellido],[Segundo_Apellido],
			 [Cedula],[Email])
values
			('Jonathan', 'Sanchez', 'Gonzalez',
			 'Tabito', '7-896-6541', 'Jonathan@hotmail.com');
go

delete a 
		from dbo.Cliente a
		where a.Primer_Nombre = 'Franklin';
go

delete b 
		from dbo.Cliente b
		where b.Segundo_Nombre = 'Miguel';
go

delete c 
		from dbo.Cliente c
		where c.Primer_Apellido = 'Versage';
go

delete d 
		from dbo.Cliente d
		where d.Cedula = '123456789';
go 

delete e
		from dbo.Cliente e
		where e.Cedula = '8-123-1234';
go


select * from Cliente
