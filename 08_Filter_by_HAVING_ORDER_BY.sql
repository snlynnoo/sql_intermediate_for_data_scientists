-- FILTERING USING ORDER BY, HAVING CLAUSE 

SELECT	cd.department_name,
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY department_name;

-- ORDER BY department name

SELECT	cd.department_name, 
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
ORDER BY cd.department_name;

-- ORDER BY count in ascedning by default

SELECT	cd.department_name, 
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
ORDER BY COUNT(*);

-- ORDER BY count in decending by default

SELECT	cd.department_name, 
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
ORDER BY COUNT(*) DESC;

-- Order by the order of column instead of COUNT(*) in ORDER BY

SELECT	cd.department_name,  -- Column (1)
		COUNT(*)             -- Column (2)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
ORDER BY 2 DESC ; -- will order by column (2) in decending order

-- Why do they can be filtered by department name or count from aggregated data?
-- This is where havinng came in, WHERE statement cannot be used here in aggregate functions.
-- It makes sense. The WHERE clause is used to determine which rows go into a paricular result set.

SELECT	cd.department_name, 
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
WHERE COUNT(*) > 50 -- Error will be prompted
ORDER BY cd.department_name;


SELECT	cd.department_name, 
		COUNT(*)
FROM data_sci.employees e 
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cd.department_name
HAVING COUNT(*) > 50 -- HAVING behaves like WHERE which filter from the aggregated result set.
ORDER BY cd.department_name;

-- Statements order : GROUP BY, HAVING, lastely ORDER BY.
