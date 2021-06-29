USE employees;
SHOW TABLES;
DESCRIBE titles;

SELECT DISTINCT title FROM titles;
/* Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager */

SELECT DISTINCT
	last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name;
-- 5 Rows

SELECT DISTINCT
	first_name,
	last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY first_name, last_name;
-- 846 Rows

SELECT DISTINCT
	last_name,
	COUNT(last_name) AS 'shared_last_name_count'
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT
	first_name,
	gender,
	COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;
	
SELECT DISTINCT
	LOWER(CONCAT(SUBSTR(first_name, 1,1), 
	SUBSTR(last_name,1,4), '_', 
	SUBSTR(birth_date,6,2), 
	SUBSTR(birth_date,3,2)))
	AS 'username', 
	COUNT(*) AS 'shared_user_count'	
FROM employees
GROUP BY username 
HAVING shared_user_count != 1
ORDER BY shared_user_count desc;