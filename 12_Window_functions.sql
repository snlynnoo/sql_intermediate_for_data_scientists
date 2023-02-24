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
FROM data_sci.employees