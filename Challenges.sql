-- CHALLENGE (1) 

-- Q: What function could you use to reformat a number from having eight dicimal places to two decimal places ?

ROUND(colunm_name, 2);
TRUNC(column_name, 2);

-- What operator would you use to filter using regular expressions?

SIMILAR TO

-- What function would you use to measure the difference in charaters between two strings?

LEVENSHTEIN()

-- CHALLENGE (2)
-- Write a query to return the count of employees in departments
-- where the total salary in that dept. is greater than $ 5,000,000
-- The result shoud be ordered from highest to lowest total salary

SELECT	cd.department_name,
		COUNT(e.*),
		SUM(salary)
FROM data_sci.employees e
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
HAVING SUM(salary) > 5000000
ORDER BY SUM(e.salary) DESC;