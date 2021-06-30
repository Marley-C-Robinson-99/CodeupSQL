USE employees;
SHOW TABLES;
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE salaries;
DESCRIBE dept_manager;
SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM information_schema.key_column_usage
WHERE CONSTRAINT_NAME = 'PRIMARY';
SELECT * FROM dept_manager;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS "Employee_name", 
d.dept_name as "Department_name",
CONCAT(e1.first_name, ' ', e1.last_name) as 'manager_name'
FROM employees as e
JOIN dept_emp as de
  	ON de.emp_no = e.emp_no
JOIN departments as d
  	ON d.dept_no = de.dept_no
JOIN dept_manager as dm
  	ON dm.dept_no = de.dept_no
JOIN employees as e1
	ON e1.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01' AND dm.dept_no = d.dept_no;


