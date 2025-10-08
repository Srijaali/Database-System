-- subquery: query within another query.
-- select statemnet inside another select,insert,update or delete statement, subquer
-- is executed first and then its result used for outer query.

drop table departments;
drop table dep;
drop table emp;
drop table emps;

create table departments(
    dep_id number primary key,
    dep_name varchar(20)
);

insert into departments(dep_id,dep_name) values (1,'CS');
insert into departments(dep_id,dep_name) values (2,'DS');
insert into departments(dep_id,dep_name) values (3,'AI');
insert into departments(dep_id,dep_name) values (4,'SE');

select*from departments;

create table students(
    stud_id number(3) primary key,
    stud_name varchar(20),
    dep_id number,
    gpa decimal (3,2),
    fee decimal(10,2),
    foreign key(dep_id) references Departments(dep_id)
    );

insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(100,'ali',1,3.2,100000);
insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(101,'aiman',2,2.2,150000);
insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(102,'amna',3,3.9,100000);
insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(103,'ahmed',4,1.2,180000);
insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(104,'fahad',1,3.8,100000);
insert into students(stud_id,stud_name,dep_id,gpa,fee) values
(105,'faheem',2,1.9,150000);

select*from students;

alter table departments rename column course to dep_name;
select*from departments;

create table faculty(
    fac_id number(3) primary key,
    fac_name varchar(20),
    dep_id number,
    salary number (10),
    join_date DATE,
    foreign key(dep_id) references departments(dep_id)
    );

insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(200,'dr.rija',1,200000,to_date('29-03-2005','dd-mm-yyyy'));
insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(201,'dr.ali',2,250000,to_date('14-05-1999','dd-mm-yyyy'));
insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(202,'dr.arham',3,100000,to_date('02-01-2007','dd-mm-yyyy'));
insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(203,'dr.dania',4,230000,to_date('17-05-2005','dd-mm-yyyy'));
insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(204,'dr.hussain',1,90000,to_date('12-12-2005','dd-mm-yyyy'));
insert into faculty(fac_id,fac_name,dep_id,salary,join_date) values
(205,'dr.hunaiza',3,200000,to_date('21-12-2000','dd-mm-yyyy'));

select*from faculty;

create table courses(
    course_id number primary key,
    course_name varchar(20),
    dep_id number,
    foreign key(dep_id) references departments(dep_id)
    );
    
insert into courses(course_id,course_name,dep_id) values
(300,'Programming',1);
insert into courses(course_id,course_name,dep_id) values
(301,'ML',2);
insert into courses(course_id,course_name,dep_id) values
(302,'DB',3);
insert into courses(course_id,course_name,dep_id) values
(303,'OOP',1);
insert into courses(course_id,course_name,dep_id) values
(304,'FSE',4);
insert into courses(course_id,course_name,dep_id) values
(305,'TBW',2);
select*from courses;

create table enroll(
    stud_id number,
    course_id number,
    primary key (stud_id,course_id),
    foreign key (stud_id) references students(stud_id),
    foreign key(course_id) references courses(course_id)
    );
insert into enroll(stud_id,course_id) values
(100,301);
insert into enroll(stud_id,course_id) values
(101,300);
insert into enroll(stud_id,course_id) values
(102,302);
insert into enroll(stud_id,course_id) values
(103,302);
insert into enroll(stud_id,course_id) values
(104,303);
insert into enroll(stud_id,course_id) values
(105,304);
insert into enroll(stud_id,course_id) values
(105,305);

select*from enroll;
-- q1
SELECT d.dep_id, d.dep_name, COUNT(s.stud_id) AS total_students
FROM departments d, students s
WHERE d.dep_id = s.dep_id
GROUP BY d.dep_id, d.dep_name
ORDER BY d.dep_id asc;

-- q2
select d.dep_id, d.dep_name, avg(gpa)
from departments d,students s
where d.dep_id = s.dep_id
group by d.dep_id, d.dep_name
having avg(gpa)>3;

-- q3
select  c.course_id, avg(s.fee) as avg_fee
from students s, courses c, enroll e
where s.stud_id = e.stud_id
and e.course_id = c.COURSE_ID
group by c.COURSE_ID;

-- q4
select d.dep_id,d.dep_name,count(*) as total_emps
from departments d , faculty f
where d.dep_id=f.dep_id
group by d.dep_id,d.dep_name
order by dep_id asc;

-- q5
select fac_id,fac_name,salary
from faculty
where salary > (select avg(salary) from faculty);

-- q6
select stud_id,stud_name 
from students
where gpa > any (
        select gpa
        from students 
        where dep_id = (select dep_id
                        from departments
                        where dep_name = 'CS'));
                        
-- q7
SELECT stud_id, stud_name, gpa
from (
select stud_id,stud_name,gpa
FROM students
ORDER BY gpa DESC
)
where rownum <=3;
 
-- q8
'''
select stud_id,stud_name
from students s, enroll e
where s.stud_id = e.stud_id
and(
select course_id
from enroll 
where stud_id = (
select stud_id 
from students
where stud_name = 'ali'));'''

SELECT s.stud_id, s.stud_name
FROM students s
JOIN enroll e ON s.stud_id = e.stud_id
WHERE e.course_id IN (
    SELECT course_id
    FROM enroll
    WHERE stud_id = (SELECT stud_id FROM students WHERE LOWER(stud_name) = 'ali')
)
GROUP BY s.stud_id, s.stud_name
HAVING COUNT(DISTINCT e.course_id) = (
    SELECT COUNT(DISTINCT course_id)
    FROM enroll
    WHERE stud_id = (SELECT stud_id FROM students WHERE LOWER(stud_name) = 'ali')
);

-- q9
select d.dep_id,d.dep_name,sum(s.fee) as total_fee
from students s, departments d
where s.dep_id = d.dep_id
group by d.dep_id,d.dep_name
order by sum(s.fee) desc;

-- q10
select distinct course_id,course_name
from courses 
where course_id in (
select course_id from enroll
where course_id in (
select stud_id from students
where gpa > 3.5)
);

-- q11
select dep_id,dep_name
from departments
where dep_id in (
select dep_id
from students
where fee > 1000000
group by dep_id
);

-- q12
select dep_id,dep_name 
from departments 
where dep_id in(
select dep_id
from faculty
where salary > 100000
) and rownum <=5;

-- q13
delete from enroll
where stud_id in (select stud_id
from students
where gpa < (select avg(gpa) from students));

delete from students
where stud_id in (
select stud_id
from students
where gpa < (select avg(gpa) from students));

-- q14
delete from courses
where course_id not in (
select course_id from enroll);

-- q15
create table high_fee as
select*from students
where fee > (select avg(fee) from students);

-- q16
create table retired_faculty as
select*from faculty
where 1=0;

insert into retired_faculty(fac_id,fac_name,dep_id,salary,join_date) 
select f.fac_id,f.fac_name,f.dep_id,f.salary,f.join_date
from faculty f
where f.join_date < (select min(join_date) from faculty);

--q17
select dep_id
from (select dep_id , sum(fee) as total_fee
        from students
        group by dep_id
        order by total_fee desc
        ) where rownum =1;

-- q18
select course_id,total_enroll
from  (select course_id,count(*) as total_enroll 
from enroll
group by course_id
order by total_enroll desc)
where rownum <= 3;

-- q19
SELECT s.stud_id, s.stud_name, e.course_id
FROM students s
JOIN enroll e ON s.stud_id = e.stud_id
WHERE s.gpa > (SELECT AVG(gpa) FROM students)
AND s.stud_id IN (
    SELECT stud_id
    FROM enroll
    GROUP BY stud_id
    HAVING COUNT(course_id) > 3
);

-- q20
CREATE TABLE Unassigned_faculty as
SELECT * FROM Faculty 
WHERE dep_id NOT IN (
    SELECT DISTINCT c.dep_id 
    FROM courses c
    JOIN enroll e on c.course_id = e.course_id
);
