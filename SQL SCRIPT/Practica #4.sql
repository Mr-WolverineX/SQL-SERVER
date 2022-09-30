use Northwind
go



--- PRACTICA # 4  ALEXANDER TACK / 8-820-1017


-- 1.   En la base de datos Northwind: Mustre todos los datos de la tabla Orders y el nombre del cliente de los
--      registros conicidentes en las ordenes (CompanyName). (Use left join)

       select Nombre_de_Clientes = b.CompanyName, a.OrderID, a.CustomerID, a.EmployeeID, a.OrderDate, a.RequiredDate, a.ShippedDate,
                                           a.ShipVia, a.Freight, a.ShipName, a.ShipAddress, a.ShipCity, a.ShipRegion,a.ShipPostalCode, 
										   a.ShipCountry
	   from  [dbo].[Orders] a left join [dbo].[Customers] b
	   on a.CustomerID = b.CustomerID
	   go



-- 2. En la base de datos Northwind: Mustre todos los datos de la tabla de productos y el nombre del proveedor de los 
--    registros concidentes(Suppliers.CompanyName) y el nombre del cliente a quien corresponden las ordenes (CompanyName). 
--    (Use left join)

