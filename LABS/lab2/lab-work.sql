SELECT count(*) as total_employees from hr.employees;
SELECT count(*) as total_employees,manager_id from hr.employees group by(manager_id);
select distinct manager_id from hr.employees;
select sum(salary) as totatl_salary from hr.employees; 
select min(salary) as min_salary from hr.employees; 
select max(salary) as max_salary from hr.employees; 
select avg(salary) as avg_salary from hr.employees; 
-- concatenation
select firsr_name||salary as fn_and_salary from hr.employees;
SELECT all salary from hr.employees;
select salary from hr.employees;
select salary from hr.employees order by(salary) asc;
select first_name,hire_date from hr.employees order by(first_name) asc;
