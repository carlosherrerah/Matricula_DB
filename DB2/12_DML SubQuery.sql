-- Empleados con salario promedio mas alto, por departamento
Select e.department_id ,e.last_name, e.salary
from employees e
   inner join (select department_id, avg(salary) promedio
               from employees
               group by department_id) t
      on e.department_id = t.department_id
where e.salary > promedio
order by e.department_id;

-- Empleando vistas
Select e.department_id, e.last_name, e.salary
from employees e 
   inner join vw_dep_avg vw 
      on e.department_id = vw.department_id
where e.salary > promedio
order by e.department_id;

-- Dpto con el salario promedio mas alto
select department_id 
from (select department_id, avg(salary) promedio
      from employees
      group by department_id) a 
where a.promedio = (select max(promedio)
			        from (select avg(salary) promedio
                          from employees
                          group by department_id ) b
				   );

select department_id, round(avg(salary),2) promedio
from employees
group by department_id 
having avg(salary) = (select max(promedio)
	                  from (select avg(salary) promedio
                            from employees
                            group by department_id ) b
			   );
 
