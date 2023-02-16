-- TABLE JOINS 

-- joining employees table and company_regions on their primary keys

SELECT *
FROM data_sci.employees
JOIN data_sci.company_regions
ON employees.region_id = company_regions.id;

-- aliasing table name 

SELECT *
FROM data_sci.employees e 
JOIN data_sci.company_regions cr
ON e.region_id = cr.id;

-- all columns from employee table and 
-- company_regions without id column from cr table

SELECT e.*, cr.region_name, cr.country_name
FROM data_sci.employees e 
JOIN data_sci.company_regions cr
ON e.region_id = cr.id;

-- only from canada (Case sensitive here)

SELECT e.*, cr.region_name, cr.country_name
FROM data_sci.employees e 
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
WHERE country_name = 'canada';

-- creating reuseable code specific to business rule
-- don't use * all the time, the columns may change over time.

SELECT	e.last_name,
		e.email,
		e.start_date,
		e.salary,
		e.job_title,
		cr.region_name, 
		cr.country_name
FROM data_sci.employees
JOIN data_sci.company_regions cr
ON e.region_id = cr.id
WHERE country_name = 'canada';

-- CHALLENGE
-- Write a query to return last name, email and department_name 
-- for employees with salaries greater than $ 120,000

SELECT	e.last_name, 
		e.email, 
		cd.department_name
FROM data_sci.employees e
JOIN data_sci.company_departments cd
ON e.department_id = cd.id
WHERE salary > 120000;
