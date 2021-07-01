USE employees;
SELECT e.emp_no, de.dept_no, e.hire_date, de.to_date, 
	IF (de.to_date ='9999-01-01', true, false) as current_emp
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no;



SELECT first_name, last_name,
	CASE 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' and 'H' THEN 'A-H' 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' and 'Q' THEN 'I-Q'
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' and 'Z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;

SELECT count(*) as num_emp,
	CASE 
		WHEN SUBSTR(birth_date, 3, 2) LIKE '5%' THEN '50\'s'
		WHEN SUBSTR(birth_date, 3, 2) LIKE '6%' THEN '60\'s'
	END AS decade_born
FROM employees
GROUP BY decade_born;

SELECT 
	CASE
		WHEN dept_name IN ('Customer Service') THEN "Customer Service"
		WHEN dept_name IN ('Finance', 'Human Resources') THEN "Finance & HR"
		WHEN dept_name IN ('Sales', 'Marketing') THEN "Sales & Marketing"
		WHEN dept_name IN ('Production', 'Quality Management') THEN "Prod & QM"
		WHEN dept_name IN ('Research', 'Development') THEN "R&D"
		ELSE "???"
	END as dept_group, AVG(salary) as avg_sal
FROM salaries
JOIN dept_emp
	ON dept_emp.emp_no = salaries.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY dept_group
ORDER BY avg_sal desc;
