SELECT count(*) as total_employees from hr.employees;
SELECT count(*) as total_employees,manager_id from hr.employees group by(manager_id);
select distinct manager_id from hr.employees;
select sum(salary) as totatl_salary from hr.employees; 
select min(salary) as min_salary from hr.employees; 
select max(salary) as max_salary from hr.employees; 
select avg(salary) as avg_salary from hr.employees; 
-- concatenation
select first_name||salary as fn_and_salary from hr.employees;
SELECT all salary from hr.employees;
select salary from hr.employees;
select salary from hr.employees order by(salary) asc;
select first_name,hire_date from hr.employees order by(first_name) asc;

select first_name,lower(first_name) from hr.employees;
select first_name,upper(first_name) from hr.employees;
select INITCAP('the soap') from dual;
select length ('kinza') from dual;
select first_name , length(first_name) from hr.employees;
select ltrim( 'kinza') from dual;
select substr('kinza khan', 7,4) from dual;
select lpad('good',7,'*') from dual;
select rpad('good',7,'*') from dual;
--date func
select ADD_MONTHS('16-sep-2000',2) from dual;
select MONTHS_BETWEEN('16-dec-2024','16-sep-2024') from dual;
select next_day('4-nov-1999','wednesday') from dual;
--converstion func
select to_char(sysdate,'DD-MM-YY') from dual;
select to_char(sysdate,'Day') from dual;
select to_char(hire_date,'Day') from hr.employees;
select * from hr.employees where to_char(hire_date,'Day')  =  'Saturday ';
