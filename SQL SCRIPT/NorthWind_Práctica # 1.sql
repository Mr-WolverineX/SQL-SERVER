use Northwind
go

--- PRACTICA # 1
--- 1.	Realice una selección de todos los empleados de la tabla empleado (EMPLOYEES).
		Select * from [dbo].[Employees]
		go
--- 2.	Realice una selección de los apellidos (LASTNAME) que son Davolio de la tabla empleado (EMPLOYEES)
		select a.EmployeeID, a.FirstName, a.LastName
		from [dbo].[Employees] a
		where a.LastName = 'Davolio'
		go

--- 3.	Selecciones tres columnas de la tabla empleados (EMPLOYEES), estas son nombre (FIRSTNAME), apellido (LASTNAME), cargo (TITLE) donde el id de empleado (EMPLOYEEID) sea 1 ,3, 5, 7, 9 . Utilice IN
		select a.FirstName, a.LastName, a.Title
		from [dbo].[Employees] a
		where a.EmployeeID in (1, 3, 5, 7, 9)
		go

--- 4.	Seleccione de la tabla categorías (CATEGORIES) todas las categorías existentes con toda su información o campos.
		select b.CategoryID, b.CategoryName, b.Description, b.Picture
		from [dbo].[Categories] b
		go

---5.	Seleccione de la tabla categoría todos los que su nombre (CATEGORYNAME) sean carnes (MEAT). Utilice like
		select b.CategoryID, b.CategoryName, b.Description, b.Picture
		from [dbo].[Categories] b
		where b.CategoryName like 'M___%'
		go

---6.	De la tabla detalle de pedidos [Order Details] selecciones todos los que son ID_de_pedido (orderid) igual a 10248 adicional en otra consulta cuente cuantos son.
		select c.OrderID, c.ProductID, c.UnitPrice, c.Quantity, c.Discount
		from [dbo].[Order Details] c 
		where [OrderID] = 10248 
		go

		select count (c.orderID)
		from [dbo].[Order Details] c
		where [OrderID] = 10248 
		go
				
---7.	De este mismo grupo Sume sus montos (sumar el campo precio por unidad unitprice.)
		select sum (c.UnitPrice)
		from [dbo].[Order Details] c
		go

---8.	De ese mismo grupo saque el promedio (avg) con el campo cantidad (quantity).
		select avg (c.Quantity)
		from [dbo].[Order Details] c
		go

---9.	De igual forma busque la cantidad mínima.
		select min (c.Quantity)
		from [dbo].[Order Details] c
		go

---10.	Y busque la cantidad máxima. 
		select max (c.Quantity)
		from [dbo].[Order Details] c
		go


		
