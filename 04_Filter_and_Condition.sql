-- GROUPING AND FILTERING using WHERE, LIKE, GROUP BY, '%'

-- last name, department id from employee who salary is greater than 1000

SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE salary > 10000;

-- filter by last name 'boyd'

SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE last_name = 'boyd';

-- filter by last name similar to 'boyd' (pattern matching)

SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE last_name LIKE 'b%';

-- this won't give desired result
SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE last_name = 'b%';

-- any character between b and d 

SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE last_name LIKE 'b%d';

-- employee any character between b and d and salary greater than 10000

SELECT last_name, department_id, salary
FROM data_sci.employees
WHERE last_name LIKE 'b%d' AND salary > 10000;

-- Total salary greater than 10000 grouped by department id

SELECT SUM(salary)
FROM data_sci.employees
GROUP BY department_id; 


