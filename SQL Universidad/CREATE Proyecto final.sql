--Wolverine

use bd_Proyecto_Final
go



create table tblClientes
(

IdClientes                      int identity not null primary key,
Identificacion                  varchar(50),
Nombre1                         varchar(45) not null,
Nombre2                         varchar(45) null,      
Apellido1                       varchar(45),          
Apellido2                       varchar(45),        
TipoCliente                     int

)
go



create table tblFactura_Encabazado
(

IdFactura                       int identity not null primary key,
Numero_de_factura               varchar(50) not null,
IdCliente                       int not null,
Fecha                           date null,      
Forma_de_Pago                   varchar(45) not null,
Tipo_de_Descuento               varchar(45),
)
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



create table tblProducto
(
Codigo_de_Producto                      int identity not null primary key,
Nombre_del_Producto                     varchar(50) not null,
Precio_de_Producto                      int not null,
Cantidad_en_stock                       int not null,
)
