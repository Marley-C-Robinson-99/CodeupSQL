USE employees;
SELECT upper(concat(first_name, ' ', last_name)) AS "full_name" FROM employees
WHERE last_name LIKE '%e';
#24292 rows
SELECT datediff(hire_date, NOW()) FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25';

SELECT LOWER(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username , first_name, last_name, birth_date FROM employees;