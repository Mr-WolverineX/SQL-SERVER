-- Alexander Tack
--  8-820-1017



-- 1.	En la base de datos Northwind: Muestre todos los datos de la tabla Orders y el nombre del cliente de los registros coincidentes en las ordenes (CompanyName). (Use left join)
		select b.[CompanyName], a.[OrderID], a.[CustomerID], a.[EmployeeID], a.OrderDate, a.RequiredDate, a.ShippedDate, a.ShipVia, a.Freight, a.ShipName, a.ShipAddress, a.ShipCity, 
		a.ShipRegion, a.ShipPostalCode, a.ShipCountry 
		from [dbo].[Orders] a left join [dbo].[Customers] b on a.CustomerID = b.CustomerID
		go

-- 2.	En la base de datos Northwind: Muestre todos los datos de la tabla de productos y el nombre del proveedor de los registros coincidentes (Suppliers.CompanyName) 
--		y el nombre del cliente a quien corresponden las ordenes (CompanyName). (Use left join)
		Select  b.ContactName, a.ProductID, a.ProductName, a.SupplierID, a.CategoryID, a.QuantityPerUnit, a.UnitPrice, a.UnitsInStock, a.UnitsOnOrder, 
		a.ReorderLevel, a.Discontinued, b.CompanyName
		from [dbo].[Products] a left join [dbo].[Suppliers] b on a.SupplierID = b.SupplierID			 
		go

-- 3.	En la base de datos Northwind: Mustre todos los datos de la tabla Customers y el número de orden de los registros conicidentes en 
--		las ordenes (Orders.OrderID). (Use right join)
		Select b.OrderID, a.CustomerID, a.CompanyName, a.ContactName, a.ContactTitle, a.Address, a.City, a.Region, a.PostalCode, a.Country, a.Phone, a.Fax
		from [dbo].[Customers] a right join [dbo].[Orders] b on a.CustomerID = b.CustomerID
		go

-- 4.	En la base de datos Northwind: Mustre todos los datos de la tabla de proveedores (Suppliers) y el nombre del producto de los registros concidentes 
--		(Products.ProductName) y el nombre del cliente a quien corresponden las ordenes (Customers.CompanyName). (Use left join)
		select b.ProductName, e.CompanyName, a.SupplierID, a.CompanyName, a.ContactName, a.ContactTitle, a.Address, a.City, a.Region, a.PostalCode, a.Country, a.Phone, a.Fax, a.HomePage
		from [dbo].[Suppliers] a left join [dbo].[Products] b on a.SupplierID = b.SupplierID
								 left join [dbo].[Order Details] c on b.ProductID = c.ProductID
								 left join [dbo].[Orders] d on c.OrderID = d.OrderID
								 left join [dbo].[Customers] e on d.CustomerID = e.CustomerID
		go

-- 5.	En la base de datos Pubs: Muestre el id de empleado (emp_id), el nombre del empleado (fname + lname) y la descripción.
		select a.emp_id, Nombre_Del_Empleado = (a.fname + ' ' + a.lname), a.minit, a.job_id, a.job_lvl, a.pub_id, a.hire_date
		from [dbo].[employee] a
		go

-- 6.	En la base de datos Pubs: Haga un listado de las ventas realizadas agrupadas por libro. Muestre el id del libro (title_id), el nombre del libro (title), 
--		la cantidad total vendida (sum(qty)), monto total vendido ( sum(qty) * price ).
		select a.title_id, a.title, Cantidad_Total_Vendida = sum(b.qty), Monto_Total_Vendido = (sum(b.qty)*a.price)
		from [dbo].[titles] a inner join [dbo].[sales] b on a.title_id = b.title_id
		group by a.title, a.title_id, a.price
		go

-- 7.	Realice el querie anterior utilizando una subconsulta para obtener el precio del libro
		select a.title_id, a.title, Precio_Del_Libro = a.price, Cantidad_Total_Vendida = sum(b.qty), Monto_Total_Vendido = (sum(b.qty)*a.price)
		from [dbo].[titles] a inner join [dbo].[sales] b on a.title_id = b.title_id
		group by a.title, a.title_id, a.price
		go

-- 8.	En la base de datos Pubs: Haga un listado de las ventas promedio realizadas agrupadas por almacén. Muestre el id del almacen (stor_id), el nombre del almacen (sotr_name), 
--		la cantidad promedio vendida (avg(qty)), monto promedio vendido ( avg(qty* price) ). Utilice una subconsulta para obtener el monto promedio vendido
		select a.stor_id, a.stor_name, Cantidad_Promedio_Vendida = avg(b.qty), Monto_Promedio_Vendido = (avg(b.qty* c.price))
		from [dbo].[stores] a inner join [dbo].[sales] b on a.stor_id = b.stor_id 
							  inner join [dbo].[titles] c on b.title_id = c.title_id
		group by a.stor_id, a.stor_name, c.price
		go





