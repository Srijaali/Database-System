create table dep(
    dep_id int primary key,
    dep_name varchar(20)
);

create table emp(
    emp_id int primary key,
    emp_name varchar(20),
    salary number(6),
    dep_id int,
    constraint salary_check check(salary>20000),
    foreign key(dep_id) references dep(dep_id)
);

alter table emp drop constraint salary_check;

insert into dep values(1,'ceo');
insert into emp(emp_id,emp_name,salary,dep_id) values (1,'rija',5000,1);

alter table emp add constraint f_k
foreign key(dep_id) references dep(dep_id);

alter table emp add bonus number(6,2) default 1000;

alter table emp add city varchar(20) default 'karachi';

alter table emp add (
    age number(2),
    constraint age_check check(age>18)
    );

delete from emp where emp_id in(1,3);

alter table emp rename column emp_name to full_name;

alter table emp modify full_name varchar(20);

alter table emp modify city varchar(20);

alter table emp add(
    email varchar(30) UNIQUE
    );
    
-- post lab

alter table emp modify bonus number(6,2) unique;

insert into emp(emp_id,full_name,salary,bonus) values (1,'rija',20000,12);
insert into emp(emp_id,full_name,salary,bonus) values (2,'ali',25000,13);

select*from emp;
select*from dep;

alter table emp add 
    dob DATE;

-- post la
select*from emp;

insert into emp(emp_id,full_name,salary,age,dob) values (3,'amna',3000,17,DATE '2009-05-10');
insert into emp(emp_id,full_name,salary,age,dob) values (3,'amna',3000,19,DATE '2004-05-10');

select constraint_name,constraint_type
from user_constraints
where table_name = 'EMP';

alter table emp drop constraint SYS_C007035;

select*from dep;
select*from emp;

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE constraint_name = 'SYS_C007038';

ALTER TABLE emp DROP CONSTRAINT SYS_C007038;

insert into emp(emp_id,full_name,dep_id,salary,age,email) values
(5,'fati',2,4500,19,'fati@mail.com');

alter table emp add constraint bonus_check unique(bonus);
select*from emp;

alter table emp add constraint f_k 
foreign key(dep_id) references dep(dep_id);

delete from emp where dep_id=2;

alter table emp add constraint f_k
foreign key(dep_id) references dep(dep_id);

insert into emp(emp_id,full_name,dep_id,salary,bonus,age,email) values
(5,'fati',2,4500,19,19,'fati@mail.com');

alter table emp drop column age;
alter table emp drop column city;

insert into dep values(2,'hr');
insert into dep values(3,'man');

select*from emp;
update emp set dep_id=1 where emp_id=1;

select e.emp_id,e.full_name,e.dep_id
from emp e , dep d
where e.dep_id=d.dep_id;

alter table emp rename column salary to monthly_salary;

select d.dep_name,d.dep_id
from dep d
where not exists
( select * from emp e where e.dep_id=d.dep_id);

truncate table emp;

SELECT d.dep_id, d.dep_name, count(e.emp_id) AS total_employees
FROM dep d
LEFT JOIN emp e ON d.dep_id = e.dep_id
GROUP BY d.dep_id, d.dep_name;

SELECT d.dep_id, d.dep_name, COUNT(e.emp_id) AS total_employees
FROM dep d
JOIN emp e ON d.dep_id = e.dep_id
GROUP BY d.dep_id, d.dep_name
HAVING COUNT(e.emp_id) = (
    SELECT MAX(COUNT(e2.emp_id))
    FROM emp e2
    GROUP BY e2.dep_id
);

