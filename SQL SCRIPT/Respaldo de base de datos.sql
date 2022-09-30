USE bd_ejemplo_02;  
GO  
BACKUP DATABASE bd_ejemplo_02  
TO DISK = 'C:\Applications\bd_ejemplo_03.Bak'  
   WITH FORMAT,  
      MEDIANAME = 'C_Applications',  
      NAME = 'Prueba de restauracion sql';  
GO  