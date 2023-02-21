-- ROLLUP function for sub-total and Grand-total (aggregated data)

SELECT	cr.country_name,
		cr.region_name,
		COUNT(e.*)
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
GROUP BY cr.country_name, cr.region_name;

-- how many employees in Canada and USA ? 
-- it is possible to use SELECT statment to implement as well

-- ROLLUP function in GROUP BY

SELECT	cr.country_name,
		cr.region_name,
		COUNT(e.*)
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
GROUP BY ROLLUP(cr.country_name, cr.region_name)
ORDER BY cr.country_name, cr.region_name;

-- CUBE function for alternative two columns combinations

SELECT	cr.country_name,
		cr.region_name,
		cd.department_name,
		COUNT(e.*)
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY cr.country_name, cr.region_name, cd.department_name
ORDER BY cr.country_name, cr.region_name, cd.department_name;

-- CUBE function in GROUP BY to generate combination of two columns

SELECT	cr.country_name,
		cr.region_name,
		cd.department_name,
		COUNT(e.*)
FROM data_sci.employees e
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
GROUP BY CUBE(cr.country_name, cr.region_name, cd.department_name)
ORDER BY cr.country_name, cr.region_name, cd.department_name;