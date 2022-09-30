--Wolverine

create database bd_Prueba
go


use bd_Prueba
go



create table tblClientes   -- Creacion de tabla de  clientes
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



-- agregar columna saldo a tabla de clientes
Alter table tblClientes 
add Saldo int;
go


--modificar tipo de datos de columna
alter table tblClientes
alter column Saldo decimal null;
go




-- cambio de datos de tabla a null para despues cambiar tipo de datos de la columna/ NO HACER/
update tblClientes set Identificacion = null where Apellido1 = 'Tack';
go

--modificar tipo de datos de columna, recomendabe que la columna este vacia 
alter table tblClientes
alter column Identificacion varchar (45) null
go





create table tblFactura_Encabezado  -- crear tabla factura encabezado
(

IdFactura                       int identity not null primary key,
Numero_de_factura               varchar(50) not null,
IdCliente                       int not null,
Fecha                           date null,      
Forma_de_Pago                   varchar(45) not null,
Tipo_de_Descuento               varchar(45),
)
go



--mdificar columna para cambio de tipo de datos
alter table tblFactura_Encabezado
alter column Numero_de_factura int not null;
go




-- crear tabla de factura detalle
create table tblFacturaDetalle
(

IdFactura_Factura_Detalle             int identity not null primary key,
Numero_de_Factura                     int not null,
Codigo_de_Producto                    int not null,
Precio_unitario                       int not null,
Cantidad_de_Producto                  int not null,          
Monto_de_Descuento                    int,
ITBM                                  binary,
Total_a_Pagar                         int not null,
)
go




-- crear tabla de producto
create table tblProducto
(
Codigo_de_Producto                      int identity not null primary key,
Nombre_del_Producto                     varchar(50) not null,
Precio_de_Producto                      int not null,
Cantidad_en_stock                       int not null,
)
