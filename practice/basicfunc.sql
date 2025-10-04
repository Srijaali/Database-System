-- concatenation op
select first_name ||  salary as "emp and sal" from employees;

select first_name || ' ' || last_name as "full name" from employees;

-- distinct keyword
select distinct(department_id) from employees;

--slelecting all
select all(salary) from employees;

-- selecting where name  a in second place
select*from employees where first_name like '_a%';

-- NULL op
select*from employees where commission_pct is null;
select*from employees where commission_pct is not null;

-- order by
select * from employees order by salary asc;

-- dual table is a duumy table
select*from dual;
-- absolute value of number x
abs(x);
--ceil , floor , trunc(x,y) , round(x,y)
-- greatest() , least()

-- Absolute value
SELECT ABS(-25) AS absolute_value;

-- Square root
SELECT SQRT(81) AS square_root;

-- Power
SELECT POWER(3, 4) AS power_value;   -- 3^4 = 81

-- Round to 2 decimals
SELECT ROUND(123.4567, 2) AS rounded_value;

-- Truncate decimal places (keeps 2 digits after decimal)
SELECT TRUNC(123.4567, 2) AS truncated_value;  
-- Result: 123.45

-- Truncate to whole number (default = 0 decimals)
SELECT TRUNC(123.987) AS truncated_value;      
-- Result: 123

-- Ceiling and Floor
SELECT CEIL(15.3) AS ceiling_value, FLOOR(15.7) AS floor_value;

-- Convert to upper and lower case
SELECT UPPER('hello') AS upper_case, LOWER('WORLD') AS lower_case;

-- Length of a string
SELECT LENGTH('Database') AS string_length;

-- Substring (start at position 2, length 3)
SELECT SUBSTR('Database', 2, 3) AS substring_value;

-- Concatenation
SELECT 'SQL' || ' Functions' AS concatenated;

-- Trim spaces
SELECT TRIM('   hello   ') AS trimmed_text;


