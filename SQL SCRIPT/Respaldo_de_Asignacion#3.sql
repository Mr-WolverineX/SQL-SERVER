-- SCRIPTS DE RESPALDO DE MI BASE DE DATOS

USE Bd_AlexanderTack_P03_01;  
GO  

BACKUP DATABASE Bd_AlexanderTack_P03_01  
TO DISK = 'C:\Applications\Bd_AlexanderTack_P03_01.Bak'  
   WITH FORMAT,  
      MEDIANAME = 'C_Applications',    --- ES OPCIONAL
      NAME = 'Respaldo Completa de base de datos Asignacion #3';  -- ES OPCIONAL
GO  