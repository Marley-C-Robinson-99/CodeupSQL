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

SELECT 
CASE
		WHEN d.dept_name = 'Customer Service' THEN "Customer Service"
		WHEN d.dept_name IN ('Finance', 'Human Resources') THEN "Finance & HR"
		WHEN d.dept_name IN ('Sales', 'Marketing') THEN "Sales & Marketing"
		WHEN d.dept_name IN ('Production', 'Quality Managment') THEN "Prod & QM"
		WHEN d.dept_name IN ('Research', 'Development') THEN "R&D"
	END as dept_group, 
AVG(s.salary) as avg_sal
FROM salaries AS s
JOIN dept_emp as de
	ON de.emp_no = s.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE s.to_date = '9999-01-01'
GROUP BY dept_group
ORDER BY avg_sal DESC
LIMIT 5;
