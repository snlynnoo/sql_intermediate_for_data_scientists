-- BASIC AGGREGATE FUNCTIONS

-- making sense of how employee table looks like 

SELECT * 
FROM data_sci.employees;

-- limit reviewing 10 rows only for employee table

SELECT * 
FROM data_sci.employees
LIMIT 10;

-- employees from region 2 only

SELECT * 
FROM data_sci.employees
WHERE region_id = 2;

-- table row count, Min and Max of salary

SELECT COUNT(*), MIN(salary), MAX(salary)
FROM data_sci.employees;

-- table row count, Min and Max of salary for region 2 only

SELECT COUNT(*), MIN(salary), MAX(salary)
FROM data_sci.employees
WHERE region_id =2;

-- Note: verify with ID number in ascending order are relevant to the data age
-- Sometimes, it is not the case that larger ID mean the data is fresh.

-- Min ID and Max ID

SELECT COUNT(*), MIN(ID), MAX(ID)
FROM data_sci.employees; 
-- count = 1046, min_id = 1, max_id = 1944
-- the smaller ID doesn't mean they are old/new.
















