
-- RESTAURACION DE RESPALDO DE LA ASIGNACION # 3

USE master;  
--Make sure the database is using the simple recovery model.  
ALTER DATABASE Bd_AlexanderTack_P03_01 SET RECOVERY SIMPLE;  
GO  

----------------------------------------------------


---- PARA HACER BACKUP

-- 1.  Back up the full AdventureWorks2012 database.  
BACKUP DATABASE Bd_AlexanderTack_P03_01   
TO DISK = 'C:\Applications\Bd_AlexanderTack_P03_01.Bak'   
  WITH FORMAT;  
GO  



-- SEGUNDA FORMA

-- 2. Create a differential database backup.  
BACKUP DATABASE Bd_AlexanderTack_P03_01   
TO DISK = 'C:\Applications\Bd_AlexanderTack_P03_01.Bak'  
   WITH DIFFERENTIAL;  
GO  

-----------------------------------------------




  -- PARA HACER RESTAURACION


  --
  -- RESTAURA Y NO LO PONE ONLINE ESPERA...
--1. Restore the full database backup (from backup set 1).  
RESTORE DATABASE Bd_AlexanderTack_P03_01   
FROM DISK = 'C:\Applications\Bd_AlexanderTack_P03_01.Bak'   
   WITH FILE = 1, NORECOVERY;  





   
   -- RESTAURA Y LO PONE ONLINE INMEDIATAMENTE
   --SEGUNDA FORMA
--2. Restore the differential backup (from backup set 2).  
RESTORE DATABASE Bd_AlexanderTack_P03_01   
FROM DISK = 'C:\Applications\Bd_AlexanderTack_P03_01.Bak'   
   WITH FILE = 2, RECOVERY;  
GO  

-- HAY OTRA FORMA DE RESTAURACION 
   -- CON WITH FILE REPLACE      