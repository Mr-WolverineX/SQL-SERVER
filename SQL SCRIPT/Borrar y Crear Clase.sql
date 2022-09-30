USE [master]
go

--Elimina la tabla que se va a crear si es que existe.
IF EXISTS(SELECT * from sys.databases WHERE name='Bd_Facturacion')  
BEGIN  
    DROP DATABASE Bd_Facturacion;  
	-- ALTER TABLE significa modificar tabla
END  


--Crea una nueva tabla llamada con el nombre q pongo
CREATE DATABASE Bd_Facturacion