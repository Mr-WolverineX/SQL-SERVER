--  Alexander Tack / 8-820-1017
--  Base de Datos


--  TAREA EN LA BASE DE DATOS (PUBS) CREAR LOS 4 PROSEDIMIENTOS PARA CADA TABLA DE LA BASE DE DATOS



--CREAR TABLA DISCOUNTS

CREATE PROCEDURE [dbo].[usp_InsertarDiscounts]
@stor_id char (4) ,   --- @ SIGNIFICA DEFINIR UN PARAMETRO   -- para que lleve OUTPUT tiene que ser llave primaria y IDENTITY
@discounttype varchar (40),
@lowqty smallint,
@highqty smallint,
@discount decimal (4,2)

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el insert  dentro de begin y end ejemplo:
	
	INSERT INTO [dbo].[discounts]
	([stor_id],[discounttype],[lowqty],[highqty],[discount])
	VALUES
	(@stor_id,@discounttype,@lowqty,@highqty,@discount
	)
	-- SET @stor_id  =  @@IDENTITY    --NO ESTOY SEGURO    Ó    SET @stor_id = Cast(SCOPE_IDENTITY() AS int)
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


-------------------------------------------------------------------------------



-- BORRAR  TABLA DISCOUNTS

CREATE PROCEDURE [dbo].[usp_BorrarDiscounts]
@stor_id char (4)   --- @ SIGNIFICA DEFINIR UN PARAMETRO   


AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el BORRADO dentro de begin y end ejemplo:
	
	DELETE C
	FROM discounts C
	WHERE
        C.stor_id = @stor_id

	
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


------------------------------------------------------------------------------------


--UPDATE  TABLA DISCOUNTS

CREATE PROCEDURE [dbo].[usp_ActualizarDiscounts]
@stor_id char (4),           --- @ SIGNIFICA DEFINIR UN PARAMETRO     
@discounttype varchar (40),
@lowqty smallint,
@highqty smallint,
@discount decimal (4,2)


AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	UPDATE c
	SET
	c.discounttype = @discounttype,
	c.lowqty = @lowqty,
	c.highqty= @highqty,
	c.discount = @discount
	from [dbo].[discounts] c
	WHERE
	c.stor_id = @stor_id	

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO



-------------------------------------------------------------------------------------

---LECTURA  TABLA DISCOUNTS

CREATE PROCEDURE [dbo].[usp_Leer_Discounts_Porllaves]
@stor_id char (4)     --- @ SIGNIFICA DEFINIR UN PARAMETRO  

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	SELECT c.stor_id, c.discounttype, c.lowqty,c.highqty,c.discount
	from discounts c
	where
	c.stor_id = @stor_id

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------



--CREAR TABLA STORES

CREATE PROCEDURE [dbo].[usp_InsertarStores]
@stor_id char (4),    --- @ SIGNIFICA DEFINIR UN PARAMETRO   -- para que lleve OUTPUT tiene que ser llave primaria y IDENTITY
@stor_name varchar (40),
@stor_address varchar (40),
@city varchar (20),
@state char (2),
@zip char (5)

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el insert  dentro de begin y end ejemplo:
	
	INSERT INTO [dbo].[stores]
	([stor_id],[stor_name],[stor_address],[city],[state],[zip])
	VALUES
	(@stor_id,@stor_name,@stor_address,@city,@state,@zip
	)
	                                  -- ( SET @stor_id  =  @@IDENTITY )   NO ESTOY SEGURO    Ó    SET @stor_id = Cast(SCOPE_IDENTITY() AS int)
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


---------------------------------------------------------------------------------




-- BORRAR  TABLA STORES

CREATE PROCEDURE [dbo].[usp_BorrarStores]
@stor_id char (4)   --- @ SIGNIFICA DEFINIR UN PARAMETRO   


AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el BORRADO dentro de begin y end ejemplo:
	
	DELETE C
	FROM stores C
	WHERE
        C.stor_id = @stor_id

	
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


-------------------------------------------------------------------------------------



--UPDATE  TABLA STORES

CREATE PROCEDURE [dbo].[usp_ActualizarStore]
@stor_id char (4),           --- @ SIGNIFICA DEFINIR UN PARAMETRO     
@stor_name varchar (40),
@stor_address varchar (40),
@city varchar (20),
@state char (2),
@zip char (5)

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	UPDATE c
	SET 
	c.stor_name = @stor_name,
	c.stor_address = @stor_address,
	c.city= @city,
	c.state = @state,
	c.zip = @zip
	from [dbo].[stores] c
	WHERE
	c.stor_id =@stor_id	

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

-------------------------------------------------------------------------------------


---LECTURA  TABLA STORES

CREATE PROCEDURE [dbo].[usp_Leer_Stores_Porllaves]
@stor_id char (4)     --- @ SIGNIFICA DEFINIR UN PARAMETRO  

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	SELECT c.stor_id, c.stor_name, c.stor_address,c.city,c.state,c.zip
	from stores c
	where
	c.stor_id = @stor_id

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------



--CREAR TABLA SALES

CREATE PROCEDURE [dbo].[usp_InsertarSales]
@stor_id char (4),    --- @ SIGNIFICA DEFINIR UN PARAMETRO   -- para que lleve OUTPUT tiene que ser llave primaria y IDENTITY
@ord_num varchar (20),
@ord_date datetime,
@qty smallint,
@payterms varchar (12),
@title_id varchar (6)

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el insert  dentro de begin y end ejemplo:
	
	INSERT INTO [dbo].[sales]
	([stor_id],[ord_date],[qty],[payterms])
	VALUES
	(@stor_id,@ord_date ,@qty,@payterms
	)
	                                 -- ( SET @stor_id  =  @@IDENTITY )   NO ESTOY SEGURO    Ó    SET @stor_id = Cast(SCOPE_IDENTITY() AS int)
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

-----------------------------------------------------------------------------------


-- BORRAR  TABLA SALES

CREATE PROCEDURE [dbo].[usp_BorrarSales]
@stor_id char (4)   --- @ SIGNIFICA DEFINIR UN PARAMETRO   


AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el BORRADO dentro de begin y end ejemplo:
	
	DELETE C
	FROM sales C
	WHERE
        C.stor_id = @stor_id

	
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

----------------------------------------------------------------------------------


--UPDATE  TABLA SALES

CREATE PROCEDURE [dbo].[usp_ActualizarSales]
@stor_id char (4),           --- @ SIGNIFICA DEFINIR UN PARAMETRO     
@ord_num varchar (20),
@ord_date datetime,
@qty smallint,
@payterms varchar (12),
@title_id varchar (6)

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	UPDATE c
	SET 
	c.ord_num = @ord_num,
	c.ord_date = @ord_date,
	c.qty = @qty,
	c.payterms = @payterms,
	c.title_id = @title_id
	from [dbo].[sales] c
	WHERE
	c.stor_id =@stor_id	

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


------------------------------------------------------------------------------------


---LECTURA  TABLA SALES

CREATE PROCEDURE [dbo].[usp_Leer_Sales_Porllaves]
@stor_id char (4)     --- @ SIGNIFICA DEFINIR UN PARAMETRO  

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	SELECT c.stor_id, c.ord_num, c.ord_date,c.qty,c.payterms,c.title_id
	from sales c
	where
	c.stor_id = @stor_id

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------



--CREAR TABLA TITLES

CREATE PROCEDURE [dbo].[usp_InsertarTitles]
@title_id varchar (6),    --- @ SIGNIFICA DEFINIR UN PARAMETRO   -- para que lleve OUTPUT tiene que ser llave primaria y IDENTITY
@title varchar (80),
@type char (12),
@price money,
@advance money,
@royalty int,
@ytd_sales int,
@notes varchar (200),
@pubdate datetime

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el insert  dentro de begin y end ejemplo:
	
	INSERT INTO [dbo].[titles]
	([title_id],[title],[type],[price],[advance],[royalty],[ytd_sales],[notes],[pubdate])
	VALUES
	(@title_id,@title ,@type,@price,@advance,@royalty,@ytd_sales,@notes,@pubdate
	)
	                                 -- ( SET @stor_id  =  @@IDENTITY )   NO ESTOY SEGURO    Ó    SET @stor_id = Cast(SCOPE_IDENTITY() AS int)
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


-----------------------------------------------------------------------------------


-- BORRAR  TABLA TITLES

CREATE PROCEDURE [dbo].[usp_BorrarTitles]
@title_id varchar (6)   --- @ SIGNIFICA DEFINIR UN PARAMETRO   


AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el BORRADO dentro de begin y end ejemplo:
	
	DELETE C
	FROM titles C
	WHERE
        C.title_id = @title_id

	
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

----------------------------------------------------------------------------------



--CREAR UPDATE TABLA TITLES

CREATE PROCEDURE [dbo].[usp_ActualizarTitles]
@title_id varchar (6),    --- @ SIGNIFICA DEFINIR UN PARAMETRO   -- para que lleve OUTPUT tiene que ser llave primaria y IDENTITY
@title varchar (80),
@type char (12),
@price money,
@advance money,
@royalty int,
@ytd_sales int,
@notes varchar (200),
@pubdate datetime


AS
BEGIN
   SET NOCOUNT ON


   UPDATE c
  SET
    c.title_id = @title_id,
	c.type = @type,
	c.price = @price,
	c.advance = @advance,
	c.royalty = @royalty,
	c.ytd_sales = @ytd_sales,
	c.notes = @notes,
	c.pubdate = @pubdate
	from [dbo].[titles] c
	WHERE
	c.title_id =@title_id
END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO


------------------------------------------------------------------------------------


---LECTURA  TABLA TITLES

CREATE PROCEDURE [dbo].[usp_Leer_Titles_Porllaves]
@titles_id char (4)     --- @ SIGNIFICA DEFINIR UN PARAMETRO  

AS
BEGIN
  SET NOCOUNT ON    -- ESTO SIGNIFICA NO CONTAR LA CANTIDAD DE REGISTRO AFECTADO

	
	-- aqui se desarrolla el UPDATE dentro de begin y end ejemplo:
	
	SELECT c.title_id, c.title, c.type,c.pub_id,c.price,c.advance,c.royalty,c.ytd_sales,c.notes,c.pubdate
	from titles c
	where
	c.title_id = @titles_id

END
GO     -- SE EJECUTA Y SE CREA EL  PROSEDIMIENTO

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------