-- MySQL
Create temporary table copy_employees
as
Select * from employees
where 1 = 2;   -- Cascaron

-- Oracle
Create Global temporary table copy_employees
ON COMMIT DELETE ROWS    -- default (Cascaron)
ON COMMIT PRESERVE ROWS  -- Se borran los datos al salir de la aplicacion
as
Select * from employees;

--E1: Hacer una copia de la tabla Empleados y agregar la columna Department_Name
create Global temporary table copy_employees
ON COMMIT PRESERVE ROWS 
as
select e.*, d.Department_Name
from employees e inner join departments d
  on e.department_id = d.department_id;

-- Creacion de una Vista
create view vw_dep_avg
as
select department_id, avg(salary) promedio
from employees
group by department_id;

select * from vw_dep_avg;

select department_id, employee_id, promedio
where employees e inner join vw_dep_avg vw using(department_id)
  
