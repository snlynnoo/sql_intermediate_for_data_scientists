-- WINDOWS FUNCTIONS (working with groups of tables)

/* Windows is a metaphor - windows over a set of rows. 
Window allows us to look in and see just a small set of rows, some subgroup and we can do some operations
like apply some function to the rows in the table. And then, we can pick up and move it to another group 
and then apply the same functions to that other group and keep repeating that process */

/* Support typical agg functions: SUM, AVG 
              New features : NTH_VALUE , NTILE
*/

-- Group by the department and who has the lowest salary in each department ?

-- random order

SELECT	department_id,
		last_name, 
		salary,
		first_value(salary) OVER (PARTITION BY department_id) -- partition means group by
		-- without any oreder, only the first row in each department will spit out
FROM data_sci.employees;

-- ascending order

SELECT	department_id,
		last_name, 
		salary,
		first_value(salary) OVER (PARTITION BY department_id ORDER BY salary ASC) 
		-- the first row in each department order by the salary in ascending order
FROM data_sci.employees;


-- the average of each department 

SELECT	department_id,
		last_name,
		salary,
		AVG(salary) OVER (PARTITION BY department_id)
FROM data_sci.employees;

-- the sum of each department, can be used with MIN/MAX as well 

SELECT	department_id,
		last_name,
		salary,
		SUM(salary) OVER (PARTITION BY department_id)
FROM data_sci.employees;


-- the whole window statement should be in the round function to round

SELECT	department_id,
		last_name,
		salary,
		ROUND(AVG(salary) OVER (PARTITION BY department_id), 2)
FROM data_sci.employees;


-- quartiles function - NTILE 

SELECT	department_id,
		last_name,
		salary,
		NTILE(4) OVER (PARTITION BY department_id ORDER BY salary) AS quartile
		-- the quartiles ( 1 ~ 4 ) in each department ordered by salary 
FROM data_sci.employees;


-- NTH_VALUE - (the nth ranking)  

SELECT	department_id,
		last_name,
		salary,
		NTH_VALUE(salary, 2) OVER (PARTITION BY department_id ORDER BY salary DESC ) AS nth_top
		-- 2nd highest salary in each department ordered by salary 
FROM data_sci.employees;

SELECT	department_id,
		last_name,
		salary,
		NTH_VALUE(salary, 5) OVER (PARTITION BY department_id ORDER BY salary DESC ) AS nth_top
		-- 5th highest salary in each department ordered by salary 
FROM data_sci.employees;