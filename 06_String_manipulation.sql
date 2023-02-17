-- REFORMATTING STRINGS/CHARACTERS

SELECT *
FROM data_sci.company_regions;

-- Uppercase the characters

SELECT UPPER(country_name)
FROM data_sci.company_regions;

-- Uppercase the characters with alias column name 'Country'

SELECT UPPER(country_name) AS country
FROM data_sci.company_regions;

-- Uppercase the first character 

SELECT INITCAP(region_name)
FROM data_sci.company_regions;

-- Lowercase the characters

SELECT LOWER(region_name)
FROM data_sci.company_regions;

-- Using one parameter in a function 

SELECT LOWER(INITCAP(region_name))
FROM data_sci.company_regions;

-- Having white space is different with without one

SELECT ' Kelly' = 'Kelly' -- false

-- Strip off white space on the left

SELECT ltrim(' Kelly') -- 'Kelly'

-- Strip off white space on the right

SELECT rtrim('Kelly ') -- 'Kelly'

-- strip off white space on both sides

SELECT rtrim(ltrim(' Kelly ')) -- 'Kelly'

-- Concatenate the string without any space

SELECT job_title || last_name 
FROM data_sci.employees;

-- Concatenate the string with separator "-"

SELECT job_title || '-' || last_name
FROM data_sci.employees;

-- Concantenate with NULL - what happen ?

SELECT job_title || '-' || NULL
FROM data_sci.employees; 

-- It is required to combine job_title and dash
-- Unfortunately, output will be NULL

-- To avoid this use CONCAT() function specifically in Postgrad

SELECT CONCAT(job_title, '-', NULL)
FROM data_sci.employees; 

SELECT CONCAT(job_title, '-', last_name)
FROM data_sci.employees;

-- Another concat function with separator, suitable for handing many variables

SELECT CONCAT_WS( '-', job_title, last_name)
FROM data_sci.employees;

-- Extracting string from characters

SELECT SUBSTRING('abcdefghi', 1, 3) AS test_string;
-------INDEX------123456789-------
-- This is give 1 ~ 3 = 'abc'

SELECT SUBSTRING('abcdefghi', from 1 for 3) AS test_string;
-- the same result

SELECT SUBSTRING('abcdefghi' from 5) AS test_string;
-- start from 5 till end => 'efghi'  # No comma in the function 


-- Query something like assistant in job title

SELECT *
FROM data_sci.employees
WHERE job_title LIKE '%assistant%';
-- Note: '%xx%' can take a while if the dataset is huge.

-- creating derived value from existing column

SELECT	job_title, 
		(job_title LIKE '%assistant%') AS is_assistant
		-- boolean statement to generate a new column
FROM data_sci.employees
WHERE job_title LIKE '%assistant%'; -- all true will be generated

SELECT	job_title, 
		(job_title LIKE '%assistant%') AS is_assistant
		-- boolean statement to generate a new column
FROM data_sci.employees
-- true or false depending on the conditional statement in a new column

-- ALTERNATIVE 'LIKE' - "SIMILAR TO"

-- Query any job title start with 'vp'

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title LIKE 'vp%';

-- Query 'vp' including 'web'

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title LIKE 'vp%'
OR    job_title LIKE 'web%';

-- Alternatively use SIMILAR TO

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title SIMILAR TO '(vp%|web%)';
-- should not have white space before and after '|'

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title SIMILAR TO 'vp%'; -- the same result with LIKE

-- Any job titile 'vp' followed by accounting or adminiatration or management etc.

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title SIMILAR TO 'vp%a%'; -- 'vp%a' is completely different

SELECT DISTINCT job_title
FROM data_sci.employees
WHERE job_title SIMILAR TO 'vp (a|m)%'; -- accounting or marketing