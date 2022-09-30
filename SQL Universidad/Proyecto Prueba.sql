--Wolverine

create database bd_Prueba
go


use bd_Prueba
go



create table tblClientes
(

IdClientes                      int identity not null primary key,
Identificacion                  varchar(50) not null,
Nombre1                         varchar(45) not null,
Nombre2                         varchar(45) null,      
Apellido1                       varchar(45) not null,         
Apellido2                       varchar(45),        
TipoCliente                     int
)
go

--Modificar tabla y agregar columna
alter table tblClientes ADD Saldo decimal;
go


insert into dbo.tblClientes ([Identificacion],[Nombre1],[Nombre2],[Apellido1],[Apellido2],[TipoCliente])
values('8-820-1017', 'Alexander', 'Enrique', 'Tack','Gonzalez', '1');
go




-- Actualizar tabla especifica
update tblClientes set Saldo = 200
where IdClientes = 1;
go




create table tblFactura_Encabazado
(

IdFactura                       int identity not null primary key,
Numero_de_factura               varchar(50) not null, -- era varchar pero luego lo actulalize
IdCliente                       int not null,
Fecha                           date null,      
Forma_de_Pago                   varchar(45) not null,
Tipo_de_Descuento               varchar(45),
)
go

--Modificar el tipo de dato de una columna
alter table tblFactura_Encabazado 
alter column Numero_de_factura int;
go



create table tblFacturaDetalle
(

IdFactura_Factura_Detalle             int identity not null primary key,
Numero_de_Factura                     varchar(50) not null,
Codigo_de_Producto                    int not null,
Precio_unitario                       int not null,
Cantidad_de_Producto                  int not null,          
Monto_de_Descuento                    int,
ITBM                                  binary,
Total_a_Pagar                         int not null,
)
go


--Modificar el tipo de dato de una columna
alter table tblFacturaDetalle 
alter column Numero_de_factura int;
go






create table tblProducto
(
Codigo_de_Producto                      int identity not null primary key,
Nombre_del_Producto                     varchar(50) not null,
Precio_de_Producto                      int not null,
Cantidad_en_stock                       int not null,
)
