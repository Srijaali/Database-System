--q1 List the employee names, job titles, department names, and city of all employees.
select e.first_name,j.job_title,d.department_name,l.city
from hr.employees e
join hr.jobs j
on e.JOB_ID=j.JOB_ID
join hr.DEPARTMENTS d
on e.department_id = d.department_id
join hr.locations l
on d.location_id=l.location_id;

-- q2. Find the employees who cam more than the average salary of their department.
Display employee_id, name, salary, department_id.
select e.employee_id,e.first_name as name ,e.salary,e.department_id
from hr.employees e
join hr.departments d
on e.department_id=d.department_id
where salary > (select avg(e2.salary) from hr.employees e2 where e2.department_id=e.department_id);

--q3 Find the names of employces who work in the same department as Steven King, bot exciude Steven King himself.
--Display employee_id, name, department_name
select e.employee_id,e.first_name as name,d.department_name,d.department_id
from hr.employees e
join hr.departments d 
on e.department_id=d.DEPARTMENT_ID
where d.DEPARTMENT_ID in (select department_id
                        from hr.employees 
                        where first_name = 'Steven' and last_name = 'King');

--q4 Display the highest paid employee in each department, showing department_name. employee_name, salary.
select e.first_name,e.salary,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.salary= (select max(salary) from employees e2
                    where e2.department_id=e.department_id);
                    
-- q5 Find the location (city) that has the maximum number 
--of employees, using the employees, departments, and locations tables.
select*from employees;
select*from departments;
select*from locations;

select city,num_employees from(
select l.city,count(*) as num_employees
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id = l.location_id
group by l.city
order by count(*) desc)
where rownum = 1;
-- q6 Display the 
--department name, manager name, and the number of employees working under each manager.

select d.department_name, m.first_name as manager_,e.manager_id,count(e.employee_id) as num_emps
from employees e
left join employees m
on e.manager_id=m.employee_id
join departments d
on d.department_id=e.department_id
group by d.department_name, m.first_name,e.manager_id;

-- q7 Find employees who were hired before their department's manager
select e.first_name,e.hire_date as emp_date,m.first_name as manager,m.hire_date as man_date,d.department_name
from employees e
left join employees m
on e.manager_id=m.employee_id
join departments d
on e.department_id=d.department_id
where e.hire_date < m.hire_date;

--q8 8. Show the job title and average salary for each job where the average salary exceeds
--S10,000.

select j.job_title,avg(e.salary) as avg_sal
from employees e
join jobs j
on e.job_id=j.job_id 
group by j.job_title
having avg(e.salary)>10000 ;

--q9: 9. list all departments that do not have any employees assigned.
--Display department id and department name.

select d.department_id , d.department_name
from departments d
where not exists ( 
select e.department_id from employees e
where e.department_id=d.department_id );

-- q10 10. Find employees who earn the maximum commission percentage in the company.
--Display employee name, salary, and

select e.first_name ||' '||e.last_name as name , e.salary,e.commission_pct
from employees e
where e.commission_pct = (select max(e2.commission_pct)
                            from employees e2);
