select sum(salary) as totalSalary from employees;

select trunc(avg(salary)) as avg from employees;

select*from employees;

select count(*) as total from employees where manager_id is not null
group by manager_id;

select * from employees 
where salary = (select min(salary) from employees);

select to_char(sysdate,'dd-mm-yyy') as curr_date from dual;

select to_char(sysdate , 'day month yyyy') as curr from dual;

select*from employees 
where to_char(hire_date,'day') = 'wednesday';

select months_between(
    to_date('01-jan-2025','dd-mon-yyyy'),
    to_date('01-oct-2024', 'dd-mon-yyyy')) as mon from dual;
    
SELECT first_name, last_name,
       MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employees;

select substr(last_name,1,5) as ln from employees;

select lpad(first_name,15,'*') as name from employees;

SELECT LTRIM(' Oracle') AS TrimmedString 
FROM dual;

select initcap(first_name || ' ' || last_name) as fn from employees;

select next_day(to_date('20-aug-2022','dd-mon-yyyy'),'monday') as nextmon
from dual;

select to_char(to_date('25-dec-2025','dd-mon-yyyy'),'monthyyyy') as monthyear
from dual;

select distinct(salary) from employees
order by salary asc;

select employee_id,first_name, round(salary,-2) as salary
from employees order by salary asc;

select department_id, count(*) as emp 
from employees
where department_id is not null
group by department_id
order by emp desc ;

SELECT *
FROM (
    SELECT department_id, SUM(salary) AS tto
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
    ORDER BY tto DESC
)
WHERE ROWNUM <= 3;

select * from
(select department_id , count(*) as emps
from employees
where department_id is not null
group by department_id
order by department_id desc)
where rownum=1;
