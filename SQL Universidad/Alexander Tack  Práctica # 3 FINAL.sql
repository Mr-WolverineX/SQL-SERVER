use Northwind
go



--- PRACTICA # 3
	

--- 1.	En la base de datos Northwind: Mostrar el nombre (Productname) de los productos cuyo id de orden  orderid = 10248 EN LA TABLA DEL DETALLE DE LA ORDEN [Order Details]
		select b.ProductName, a.OrderID --- (Dejo OrderID para verificar que este bien)
		from [dbo].[Order Details] a inner join  [dbo].[Products] b
		on a.OrderID = 10248 
		go

--- 2.	En la base de datos Northwind: Mostrar el nombre de la categoría categoryname cuyo id de producto productid  sea igual a 22 o 31 o 9. Use in
		select b.CategoryName, c.ProductID ---(Dejo ProductID para verificar que este bien)
		from [dbo].[Categories] b inner join [dbo].[Products] c
		on c.ProductID in (22, 31, 9)
		go

--- 3.	En la base de datos Northwind: Que empleados, lastname, tienen ordenes de clientes (tabla orders) cuyo id  (customerid) = ‘QUICK’.
		select a.EmployeeID, a.FirstName, a.LastName, b.CustomerID ---(Dejo CustomerID para verificar que este bien)
		from [dbo].[Employees] a inner join [dbo].[Orders] b
		on b.CustomerID = 'QUICK'
		go

--- 4.	En la base de datos Pubs: Muestre todos los datos del Empleado cuyo id (emp_id) es: PMA42628M y además muestre la descripción de su empleo (job_desc)
		use pubs
		select a.emp_id, a.fname, a.minit, a.lname, a.job_id, a.job_lvl, a.pub_id, a.hire_date, b.job_desc
		from [dbo].[employee] a inner join  [dbo].[jobs] b
		on a.emp_id = 'PMA42628M'
		go

--- 5.	En la base de datos Pubs: Muestre todos los datos del Empleado cuyo id es: PMA42628M, además muestre el nombre de la editorial para la que trabaja. 
---		Utilice el alias P para la tabla publishers, E para la tabla employee, Editorial para el campo pub_name.
		
		select e.emp_id, e.fname, e.minit, e.lname, e.job_id, e.job_lvl, e.pub_id, e.hire_date, Editorial = p.pub_name
		from [dbo].[employee] e inner join [dbo].[publishers] p 
		on e.emp_id = 'PMA42628M'
		go

--- 6.	En la base de datos Pubs: Identifique las ordenes de compra por almacén. Muestre el nombre del almacén (stor_name),  el número de orden de compra (ord_num), 
---		la fecha de la orden de compra (ord_date)
		select a.stor_name, b.ord_num, b.ord_date
		from [dbo].[stores] a inner join [dbo].[sales] b
		on a.stor_id = b.stor_id
		go

--- 7.	En la base de datos Pubs: Identifique los libros vendidos por almacén y libro. Muestre el nombre del almacén (stor_name),
---		el número de orden de compra (ord_num), el nombre del Libro (title)
		select a.stor_name, b.ord_num, c.title
		from [dbo].[stores] a inner join  [dbo].[sales] b
		on a.stor_id = b.stor_id
	                          inner join [dbo].[titles] c
		on b.title_id = c.title_id 
		go




--- 8.	En la base de datos Pubs: Identifique los libros vendidos por almacén y autor. Muestre el nombre del almacén (stor_name), 
---		el número de orden de compra (ord_num), el nombre del Libro (title), nombre del autor (au_fname  + au_lname )
		select a.stor_name, b.ord_num, c.titles, d.titleauthor, e.authors
		from [dbo].[stores] a inner join [dbo].[sales] b 
		on a.stor_id = b.stor_id
		                       inner join [dbo].[titles] c
		on b.title_id = c.title_id
		                       inner join [dbo].[titleauthor] d
        on c.title_id = d.title_id
						       inner join [dbo].[authors] e
		on d.au_id = e.au_id

		go
		     
		   --↑↑↑↑↑ --- HACE FALTA SABER QUE PASA AQUI




--- 9.	En la base de datos Pubs: Haga un listado de los libros existentes y sus autores. Muestre el nombre del libro y el nombre del/los autores
		select Libros_Existentes = c.title, Nombre_del_Autor = (d.au_fname + d.au_lname)
		from[dbo].[titles] c, [dbo].[authors] d
		go

--- 10.	En la base de datos Pubs: Haga un listado de los libros existentes y sus autores. Muestre el nombre del libro y el nombre del/los autores ( SE REPITIO )
		select Libros_Existentes = c.title, Nombre_del_Autor = (d.au_fname + d.au_lname)
		from[dbo].[titles] c, [dbo].[authors] d
		go

--- 11.	Al listado anterior agregue el nombre de la editorial (pub_name)
		select Libros_Existentes = c.title, Nombre_del_Autor = (d.au_fname + d.au_lname), Editorial = p.pub_name
		from[dbo].[titles] c, [dbo].[authors] d, [dbo].[publishers] p
		go

--- 12. En la base de datos Northwind: En ocasiones será necesario enlazar una tabla consigo misma (relaciones recursivas). 
---		Por ejemplo, considérese que la tabla Employees la cual contiene como llave primaria la culumna EmployeeID, que establece el código de identificación de cada empleado en la empresa. 
---		La misma tabla contiene el campo ReportsTo que establece el código de identificación del jefe inmediato de cada empleado.
---		Haga un querie que muestre el nombre y apellido del Empleado (fname + lname) y el nombre y apellido del jefe inmediato.
		use Northwind
		go

		with EmployeesJefes
		(EmployeeID, FirstName, LastName, ReportsTo, Jefe)
		as
		(select EmployeeID, FirstName, LastName, ReportsTo, LastName
		from Employees where reportsTo IS NULL
		union all
		select Employees.EmployeeID, Employees.FirstName, Employees.LastName,
		Employees.ReportsTo, EmployeesJefes.LastName
	
		from Employees
		JOIN EmployeesJefes ON Employees.ReportsTo = EmployeesJefes.EmployeeID
		)

		Select * from EmployeesJefes

--- 13.	En la base de datos Northwind: Haga un listado de las ventas por empleado. Muestre el id del empleado (EmployeeID), el nombre del empleado (FirstName + LastName)
		--- ( NO ENTENDI BIEN LA REFERENCIA)
		select b.EmployeeID, Nombre_del_Empleado = (b.FirstName + b.LastName)
		from [dbo].[Employees] as b
		go

--- 14.	En la base de datos Northwind: Mustre todos los datos de la tabla Orders y el nombre del cliente a quien corresponden las ordenes (Customers.CompanyName)
		select Ordenes_Del_Cliente = b.CompanyName, a.OrderID, a.CustomerID, a.EmployeeID, a.OrderDate, a.RequiredDate, a.ShippedDate, a.ShipVia, a.Freight, a.ShipName, a.ShipAddress, a.ShipCity, a.ShipRegion,
				a.ShipPostalCode, a.ShipCountry
		from [dbo].[Orders] a, [dbo].[Customers] b
		go

--- 15.	En la base de datos Northwind: Mustre todos los datos de la tabla de productos y el nombre del proveedor (Suppliers.CompanyName) y el nombre del cliente a quien corresponden 
---		las ordenes (Customers.CompanyName)
		select Nombre_Del_Proveedor = b.CompanyName, Nombre_Del_Cliente = c.CompanyName, a.ProductID, a.ProductName, a.SupplierID, a.CategoryID, a.QuantityPerUnit, a.UnitPrice, a.UnitsInStock, a.UnitsOnOrder, a.ReorderLevel, a.Discontinued
		from [dbo].[Products] a, [dbo].[Suppliers] b, [dbo].[Customers] c
		go
