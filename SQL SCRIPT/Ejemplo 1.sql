USE [db_PrimerEjemplo]
go

create table "tbl_Colobaradores" (

IdColaborador         integer not null primary key,
NombreColaborador     varchar(100) not null,
ApellidoColaborador   varchar (100) not null,
Email                 varchar(200),
Telefono              varchar (10),
Celular                varchar (10),

)
go

create table tbl_Departamentos (

IdDepartamento        integer not null primary key,	
NombreDepartamento    varchar(500) not null,

)

go

create table tbl_ColaboradoresDepartamentos(

IdColaboradoresDepartamentos    integer not null primary key,



)
go