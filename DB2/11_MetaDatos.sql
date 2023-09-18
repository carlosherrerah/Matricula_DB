-- DB ESQUEMAS:  D_(DJs), F_(Fast Foods), WF_(countries), SinPrefijo(HR)

-- MySQL
select * from information_schema.schemata
select * from information_schema.tables
select * from information_schema.columns

use information_schema;
select * from schemata;

select count(*) 
from information_schema.tables
where table_schema='esquemas'
  and table_name like 'd\_%';


-- ORACLE

select * from dictionary;       -- Tablas de los metadatos
-- user_tables = tabs = tab
select * from user_tables;      -- Tablas del usuario
select * from user_tab_columns  -- Columnas de cada tabla

--E1: Mostrar las tablas de la DB D_
SELECT * FROM TAB
WHERE TNAME LIKE 'D\_%' ESCAPE '\';

