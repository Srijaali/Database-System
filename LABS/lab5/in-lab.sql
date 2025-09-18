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



