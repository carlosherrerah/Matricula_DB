-- sqlServer
Select top 10 * from persona;

-- MySQL
Select * from persona limit 10;

-- ORACLE
Select * from persona 
where rownum <= 10

-----------------------  C R E A T E  -----------------------------------------
CREATE TABLE CIUDADES (
IDCIUDAD INT, 
ABR CHAR(5),
NOMBRE VARCHAR2(50) not null,
CAPITAL VARCHAR2(50) NULL,
TOT_MUN NUMBER DEFAULT 0,
CONSTRAINT PK_CIU PRIMARY KEY(IDCIUDAD),
CONSTRAINT UNIQUE_abr UNIQUE (abr),
CONSTRAINT CHECK_MUN CHECK(idCiudad >= 1 and idCiudad <= 33)
);

CREATE TABLE MUNICIPIOS (
IDCIUDAD INTEGER,
IDMUNICIPIO NUMBER(5),
NOMBRE VARCHAR(50),
TOT_LOC NUMBER(10,2),
CONSTRAINT PK_MUN PRIMARY KEY (IDCIUDAD, IDMUNICIPIO),
CONSTRAINT FK_Ciu_Mun FOREIGN KEY (idCiudad) 
			  REFERENCES Ciudades (idCiudad)
	[ON DELETE Cascade | ON UPDATE Cascade]
);

--	ON DELETE Cascade   ON UPDATE Cascade
--	ON DELETE set null  ON UPDATE set null
--	ON DELETE no action ON UPDATE no action   Default
--	ON DELETE restrict  ON UPDATE Restrict


CREATE TABLE Empleados(
    idEmpleado integer auto_increment primary key,
    nombre varchar(40),
    idCiudad integer,
    idMunicipio integer,
    Fecha_Nac date DEFAULT NULL,
    Sexo char(1),
    Estatus boolean, tinyint(1)
    CONSTRAINT FK_Emp_Mun FOREIGN KEY (IDCIUDAD, idmunicipio) 
                 REFERENCES municipios(IDCIUDAD, idmunicipio)
);

-- mysql
CREATE TABLE Camisas (
    nombre VARCHAR(40),
    talla ENUM('small', 'medium', 'large')
);

INSERT INTO camisas(nombre, talla) VALUES 
('dress shirt','large'), 
('t-shirt','medium'),
('polo shirt','small');

-- Oracle
CREATE TABLE Camisas(
nombre VARCHAR(40),
talla  VARCHAR(10),
constraint check_size CHECK( talla IN ('small', 'medium', 'large') )
);

INSERT INTO camisas(nombre, talla) VALUES 
('polo shirt','small');

-- Copy a structure
create table Entidades
as 
select * from ciudades where 1=2;


create index idx_nombre on municipios(nombre);

-- mysql
ALTER TABLE empleados
MODIFY idEmpleado int NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4; 

-- Oracle
CREATE SEQUENCE dept_deptid_seq
INSERT INTO Departments
		(department_id, department_name)
		VALUES
		(dept_deptid_seq.NEXTVAL, 'Inventarios');



-- SQLServer   Autoincrement	should start at value 10 and increment by 5
CREATE TABLE Persons (
ID int IDENTITY(10,5) PRIMARY KEY   10,15,20,25,30, etc
LastName varchar(50) NOT NULL,
BirthDate datetime NULL ,
CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
)

select max(idempleado) into a
insert  into values (a+1, "pepito")

------------------------------- A L T E R -------------------------------------

-- Renombrar tabla
alter table Entidades rename to Ciudades;				-- 2 
rename Entidades to ciudades; 							-- Oracle 

-- Borrar una tabla
drop table Empleados;
drop table if exists Ciudades;							-- MySQL

-- Crear un campo
alter table Ciudades add    alcalde   varchar(20);
 
-- modificar un campo
alter table Ciudades modify alcalde   varchar(10);

-- renombrar un campo 
alter table Ciudades change alcalde gobernador char(10);-- MySQL
alter table ciudades rename alcalde to gobernador;		-- Oracle

-- Borrar un campo
alter table Ciudades drop column gobernador;

-- Crear una primary Key
ALTER TABLE Ordenes
 ADD CONSTRAINT PK_Ord PRIMARY KEY (IdOrden);

ALTER TABLE detalleOrdenes
 ADD CONSTRAINT PK_Ord_Pro PRIMARY KEY (IdOrden, IdProducto);

-- Crear un indice Unico
alter table Ciudades add CONSTRAINT unique_abr unique (abr);
create [unique] index unique_abr on Ciudades(abr);

-- Crear un Indice compuesto ... Se puede repetir
alter table Empleados add index Idx_Emp (idciudad, idmunicipio); -- MySQL
create index Idx_Emp on empleados(idciudad, idmunicipio);

-- Drop an Index
ALTER TABLE empleados DROP INDEX Idx_Emp;		   -- MySQL
alter table Empledos  drop constraint Idx_Emp   -- Oracle 
drop index idx_nombre;               			   -- Oracle

-- Renombrar un Indice
ALTER TABLE ciudades DROP INDEX unique_abr,
      ADD UNIQUE INDEX unique_abreviatura (abr, ASC);	-- MySQL
ALTER INDEX IDX_EMP RENAME TO IDX_EMPLEADOS;			-- Oracle

-- Crear una relacion 
ALTER TABLE empleados 
   ADD CONSTRAINT FK_Emp FOREIGN KEY (IDCIUDAD, idmunicipio) 
                         REFERENCES municipios(IDCIUDAD, idmunicipio);
-- Drop Relation                         
ALTER TABLE empleados DROP FOREIGN KEY FK_Emp;			-- MySQL
ALTER TABLE Empleados DROP CONSTRAINT  FK_EMP;			-- Oracle
ALTER TABLE CIUDADES  DROP CONSTRAINT UNIQUE_abr;     -- Oracle

-- Crear un Constraint tipo Check
alter table ciudades 
add CONSTRAINT lim_totmun CHECK (tot_mun> 0);		-- Oracle







