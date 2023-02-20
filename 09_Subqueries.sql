-- SUBQUERIES
-- can be used in either SELECT/FROM/WHERE statement

-- Subqueries in SELECT Statment 

SELECT	e1.last_name, -- e1 = outer table
		e1.salary,
		e1.department_id,
		(SELECT ROUND(AVG(e2.salary),2)
		 FROM data_sci.employees e2 
		 WHERE e1.department_id = e2.department_id ) -- e2 = inner table
FROM data_sci.employees e1

-- Subqueries in FROM statement

SELECT ROUND(AVG(e1.salary), 2) -- must specify the alias e1 statement
FROM (SELECT * 
	  FROM data_sci.employees
	  WHERE salary > 100000) e1;  -- basic for complex logic and readability
	 
-- Query which can give the same result 

SELECT ROUND(AVG(salary), 2)
FROM data_sci.employees
WHERE salary > 100000;

-- Subqueries in WHERE statement
-- the subquery should be boolean / conditional clause in WHERE statement

SELECT department_id
FROM data_sci.employees e1
WHERE (SELECT MAX(salary)
	   FROM data_sci.employees e2) = e1.salary;