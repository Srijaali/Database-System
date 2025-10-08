
SELECT * FROM hr.employees;
select * from hr.DEPARTMENTS;
select * from hr.locations;
select * from hr.jobs;
--q1
select e.first_name,j.job_title,d.department_name,l.city
from hr.employees e
join hr.jobs j
on e.JOB_ID=j.JOB_ID
join hr.DEPARTMENTS d
on e.department_id = d.department_id
join hr.locations l
on d.location_id=l.location_id;

-- q2
select e.employee_id,e.first_name as name ,e.salary,e.department_id
from hr.employees e
join hr.departments d
on e.department_id=d.department_id
where salary > (select avg(e2.salary) from hr.employees e2 where e2.department_id=e.department_id);

--q3
select e.employee_id,e.first_name as name,d.department_name,d.department_id
from hr.employees e
join hr.departments d 
on e.department_id=d.DEPARTMENT_ID
where d.DEPARTMENT_ID in (select department_id
                        from hr.employees 
                        where first_name = 'Steven' and last_name = 'King');

--q4
select 
