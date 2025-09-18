q1)
create table employees(
name varchar(20),
id int primary key,
d_no int,
foreign key (d_no) references departments(d_num));

create table departments(
d_num int primary key,
d_name varchar(20) );

select * from employees;
select * from departments;

insert into departments values (1,'hr');
insert into departments values (2,'manager');
insert into departments values (3,'aweyi');
insert into departments values (4,'ai');
SELECT * FROM departments;


insert into employees values ('rija', 1, 1);
insert into employees values ('rijali', 7, 1);
insert into employees values ('ali', 3, 3);
SELECT * FROM employees;

select e.name, e.id, e.d_no, d.d_num, d.d_name
from employees e
cross join departments d;

q2)

select e.name, e.id, e.d_no, d.d_num, d.d_name
from departments d
left join employees e on d.d_num = e.d_no
order by d.D_NUM;


-- q3
select e.emp_name as employee, m.emp_name as manager
from employees e
left join employees m
on e.manager_id = m.emp_id;

-- q4
select e.emp_id, e.emp_name
from employees e
left join employee_project ep
on e.emp_id = ep.emp_id
where ep.project_id is null;

-- q5
select s.student_name, c.course_name
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id;

-- q6
select c.customer_id, c.customer_name, o.order_id, o.order_date
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- q7
select d.dept_id, d.dept_name, e.emp_id, e.emp_name
from departments d
left join employees e
on d.dept_id = e.dept_id;

-- q8
select t.teacher_name, s.subject_name
from teachers t
cross join subjects s;

-- q9
select d.dept_id, d.dept_name, count(e.emp_id) as total_employees
from departments d
left join employees e
on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name;

-- q10
select s.student_name, c.course_name, t.teacher_name
from student_course_teacher sct
join students s
on sct.student_id = s.student_id
join courses c
on sct.course_id = c.course_id
join teachers t
on sct.teacher_id = t.teacher_id;
