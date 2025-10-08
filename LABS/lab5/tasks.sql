select * from employees;
select * from departments;
select*from jobs;

-- q1
select e.EMPLOYEE_ID,e.first_name,d.department_id,d.department_name
from employees e
cross join departments d;

-- q2
select d.department_id,d.department_name,e.employee_id,e.first_name
from departments d
left join employees e
on d.department_id = e.department_id;

-- q3
select e.first_name as emp ,e.employee_id as emp_id, m.first_name as manager, m.manager_id as man_id
from employees e
left join employees m
on e.manager_id = m.employee_id;

-- q4
select e.employee_id,e.first_name,j.job_id
from employees e
left join jobs j
on e.job_id=j.job_id
where e.job_id is null;


-- q5
select s.stud_name,c.course_name
from students s
join enroll e
on s.stud_id=e.stud_id
join courses c 
on c.course_id=e.course_id;

-- q6
select c.customer_name,c.customer_id
from customers c
left join orders o
on c.customer_id=o.customer_id;

-- q7
select d.department_id,d.department_name,e.employee_id,e.first_name
from departments d
left join employees e
on d.department_id=e.department_id;

-- q8
-- lab5 q8
select fac_name,course_name
from faculty f
cross join courses c;

-- q9
select d.department_id,d.department_name,count(e.employee_id) as total_emp
from employees e
right join departments d
on e.department_id=d.department_id
group by d.department_id,d.department_name
order by total_emp desc;

--q10
SELECT s.stud_name,c.course_name,f.fac_name
from students s
join enroll e 
  on s.stud_id = e.stud_id
join courses c 
  on e.course_id = c.course_id
join faculty f 
  on c.dep_id = f.dep_id;
  
-- q11
select stud_name,fac_name
from students s
join faculty f
on s.city = f.city;

-- q12
select e.employee_id,e.first_name,m.first_name,m.manager_id
from employees e
left join employees m
on e.manager_id=m.employee_id;

-- q13
select first_name,employee_id
from employees
where department_id is null;

-- q14
select d.department_name , avg(e.salary)
from employees e 
join departments d
on e.department_id = d.department_id
group by d.department_name
having avg(e.salary) > 50000;

--Q15
select e.first_name,d.department_name,e.salary
from employees e
join departments d
on e.department_id=d.department_id
where e.salary > (select avg(e2.salary) from employees e2 where e2.department_id=d.department_id
);

-- q16
select d.department_name
from departments d
join employees e
on d.department_id = e.department_id
group by d.department_name
having min(e.salary) >= 30000;

--q17
select s.stud_name,c.course_name
from students s
join enroll e
on s.stud_id=e.stud_id
join courses c
on e.course_id=c.course_id
where s.city='lahore';

-- q18
select e.first_name as emp ,e2.first_name as manager,d.department_name as dep_name
from employees e
left join employees e2
on e.manager_id=e2.employee_id
join departments d
on e.department_id=d.department_id
where e.hire_date between TO_DATE('2020-01-01','yyyy-mm-dd') 
and TO_DATE('2023-01-01','yyyy-mm-dd') ;

-- q19
select stud_name
from students s
join enroll e
on s.stud_id = e.stud_id
join courses c
on e.course_id=c.course_id
join faculty f
on c.dep_id = f.dep_id
where f.fac_name = 'dr.ali';

--q20
select e.first_name as employee_name, m.first_name as manager_name,e.department_id
from employees e
join employees m
  on e.manager_id = m.employee_id
 and e.department_id = m.department_id;
