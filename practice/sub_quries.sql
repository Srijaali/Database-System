-- subquery: query within another query.
-- select statemnet inside another select,insert,update or delete statement, subquer
-- is executed first and then its result used for outer query.


select max(salary) from employees;
select*from employees
where salary = (select max(salary) from employees);

-- the returned data of subquery:
-- 1. scalary subquery: return one value use = 
-- 2. row subquery: returns from one col series of rows use in, not in
-- 3. tanle subquery: returns a mini table (row , cols) **use in**

--working of subquery:
-- independent subquery: inner query not related to outer query, like above example
-- correlated : inner and outer are attached one can't proceed without other.

select*from employees;

select max(salary*commission_pct) from employees;
select * from employees
where (salary*commission_pct) = (select max(salary*commission_pct) from employees);

select avg(salary) from employees;
select count(*) from employees 
where salary > (select avg(salary) from employees);

select*from employees;

select avg(salary) from employees;
select count(*) from employees
where salary > (select avg(salary) from employees);

select max(salary) from employees
where salary = (select count(*) from employees
where salary > (select avg(salary) from employees));

-- row subquery
select distinct(manager_id) from employees;
select employee_id from employees 
where manager_id not in (select distinct(manager_id) from employees);

select employee_id from employees
where salary = (select Max(Salary) from employees);

select*from movies 
where director in (select director from movies
                    group by director
                    order by sum(gross) desc);

select * from movies 
where star in (select star,avg(score) from movies
                where votes >25000
                group by star
                having avg(score)>8.5);

-- table subquery

select*from movies 
where(year,gross-budget) in(select year,max(gross-budget) 
                            from movies
                            group by year);

select*from movies 
where (genre,score) in (
    select genre,max(score) from movies
    where votes > 25000
     group by genre);
    
select*from movies
where (star,director,gross) in (
                select star,director,max(gross) from movies
                group by star,director
                order by sum(gross) asc);

--correlated query


   
