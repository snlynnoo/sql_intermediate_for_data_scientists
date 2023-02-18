-- REFORMAT NUMERIC DATA

-- Trunc function (direct cut off without rounding down the decimal)

SELECT TRUNC(AVG(salary))
FROM data_sci.employees;

-- Trunc with custom cut off 

SELECT TRUNC(AVG(salary), 4) 
FROM data_sci.employees; -- direct cut off up to 4 decimal without rounding down

-- Similar TRUNC function (cannot be customized the decimal places)

SELECT CEIL(AVG(salary)) -- always round UP and output discreet value
FROM data_sci.employees;

SELECT FLOOR(AVG(salary)) -- always round DOWN and output discreet value
FROM data_sci.employees;

-- Round function (rounding down accd. the adjcent decimal value)

SELECT ROUND(AVG(salary))
FROM data_sci.employees;

-- Round function with custom round 

SELECT ROUND(AVG(salary), 2)
FROM data_sci.employees;



