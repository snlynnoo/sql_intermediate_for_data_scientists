-- Top ten salary with just last_name (simple query)

SELECT	last_name, 
		MAX(salary)
FROM data_sci.employees
GROUP BY last_name
ORDER BY MAX(salary) DESC
LIMIT 10;

-- Top ten with details

SELECT *
FROM data_sci.employees
ORDER BY salary DESC
LIMIT 10;

-- Alternatively 

SELECT *
FROM data_sci.employees
ORDER BY salary DESC
FETCH FIRST 10 ROWS ONLY; -- Standard SQL keywords for first 10 rows