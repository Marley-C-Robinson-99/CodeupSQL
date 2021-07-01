USE employees;
SELECT e.emp_no, de.dept_no, e.hire_date, de.to_date, 
	IF (de.to_date ='9999-01-01', true, false) as current_emp
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no;

SELECT first_name, last_name, birth_date,
	CASE 
		WHEN SUBSTR(birth_date, 3, 2) LIKE '5%' THEN '50\'s'
		WHEN SUBSTR(birth_date, 3, 2) LIKE '6%' THEN '60\'s'
	END AS 'decade_born'
FROM employees;

SELECT first_name, last_name,
	CASE 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' and 'H' THEN 'A-H' 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' and 'Q' THEN 'I-Q'
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' and 'Z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;