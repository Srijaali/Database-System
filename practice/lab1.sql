-- lab 1
select employee_id,first_name,department_id from employees
where department_id != 100;

select employee_id,first_name,salary from employees
where salary in(10000,12000,15000);

select first_name,salary  from employees where salary <= 25000;

select * from employees where department_id != 60;

select * from employees where department_id between 60 and 80;

select*from departments;

select*from employees where first_name = 'Steven';

select * from employees where (salary between 15000 and 25000) and (department_id = 80);

select*from employees
where salary < ANY (select salary from employees where department_id=100);

select*from employees e 
where 1 = (select count(*) from employees where department_id = e.department_id);

select*from employees where hire_date between 
to_date('01-JAN-2005','DD-MON-YYYY') and to_date('31-DEC-2006','DD-MON-YYYY');

select*from employees where manager_id is NULL;

select*from employees where salary < ALL 
(select salary from employees where salary>8000);

select*from employees where salary > ANY
(select salary from employees where department_id = 90);
/*
select d.department_name 
from  departments d,employees e 
where e.department_id = d.department_id;
dep per employee
*/

-- dep that have emp
select department_name from
departments d
where EXISTS (select * from employees e where e.department_id = d.department_id);

select department_name from
departments d
where not EXISTS (select * from employees e where e.department_id = d.department_id);

select*from employees where salary not between 5000 and 15000;

select * from employees
where department_id in (10,20,30) and department_id != 40;

select*from employees
where salary < (select min(salary) from employees where department_id = 50);

select * from employees
where salary > (select max(salary) from employees where department_id = 90);

