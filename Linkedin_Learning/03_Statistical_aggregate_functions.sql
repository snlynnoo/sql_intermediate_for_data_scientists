-- DESCRIPTIVE STATICAL AGGREGATE FUNCTIONS

-- total amount of all salary

SELECT SUM(salary)
FROM data_sci.employees;

-- total amount & average of salary by department (group)

SELECT department_id, SUM(salary), AVG(salary)
FROM data_sci.employees
GROUP BY department_id; 

-- Only with 2-decimals in average salary

SELECT department_id, SUM(salary), ROUND(AVG(salary),2)
FROM data_sci.employees
GROUP BY department_id;

-- variance (spread of data)
-- VAR_POP is suppoted by Postgre and SQL

SELECT department_id, SUM(salary), ROUND(AVG(salary),2), ROUND(VAR_POP(salary),2)
FROM data_sci.employees
GROUP BY department_id;

-- standard deviation 

SELECT  department_id,
		SUM(salary), 
		ROUND(AVG(salary),2), 
		ROUND(VAR_POP(salary),2), 
		ROUND(STDDEV_POP(salary),2)
FROM data_sci.employees
GROUP BY department_id;