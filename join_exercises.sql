USE employees;
SHOW TABLES;

SELECT * FROM dept_emp
LIMIT 5;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

USE employees;
DESCRIBE dept_emp;
SELECT * FROM dept_manager
LIMIT 5;


SELECT * FROM dept_emp
LIMIT 5;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS manager_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS m
  ON m.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = m.dept_no
WHERE m.to_date = '9999-01-01' AND e.gender = 'F';
/* full_name      | dept_name          |
------------------|--------------------|
Vishwani Minakawa | Marketing          |
Isamu Legleitner  | Finance            |
Karsten Sigstam   | Human Resources    |
Oscar Ghazalie    | Production         |
Leon DasSarma     | Development        |
Dung Pesch        | Quality Management |
Hauke Zhang       | Sales              |
Hilary Kambil     | Research           |
Yuchang Weedman   | Customer Service   | */


SELECT DISTINCT t.title as 'Title', COUNT(db.emp_no) as 'Count'
FROM titles as t
LEFT JOIN dept_emp as db
  ON db.emp_no = t.emp_no
JOIN departments as d
  ON d.dept_no = db.dept_no
WHERE t.to_date = '9999-01-01' AND db.dept_no = 'd009' and 
GROUP BY t.title
ORDER BY Title; 

SELECT distinct CONCAT(e.first_name, ' ', e.last_name) as 'Name',
d.dept_name as 'Department_Name',
s.salary as 'Salary'
FROM employees as e
JOIN dept_manager as m
  ON m.emp_no = e.emp_no
JOIN salaries as s
  ON s.emp_no = m.emp_no
JOIN departments as d
  ON d.dept_no = m.dept_no
WHERE m.to_date = '9999-01-01' and s.to_date = '9999-01-01'
ORDER BY Department_name;

SELECT d.dept_no as dept_no, d.dept_name as Department, COUNT(e.emp_no) as num_emp
FROM employees as e
JOIN dept_emp as de
  ON de.emp_no = e.emp_no
LEFT JOIN departments as d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY d.dept_no;

SELECT avg(s.salary) AS avg_sal,
d.dept_name as department
FROM dept_emp as de
JOIN employees as e
  ON e.emp_no = de.emp_no
JOIN departments as d
  ON d.dept_no = de.dept_no
JOIN salaries as s
  ON s.emp_no = de.emp_no
  AND de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY avg_sal desc
LIMIT 1;

SELECT CONCAT(first_name, ' ', last_name) as 'full_name', s.salary as 'salary'
FROM employees as e
JOIN dept_emp as de
  ON de.emp_no = e.emp_no
JOIN departments as d 
  ON d.dept_no = de.dept_no
JOIN salaries as s
  ON s.emp_no = e.emp_no
WHERE de.to_date = "9999-01-01" AND s.to_date = "9999-01-01" AND d.dept_name = "marketing"
GROUP BY full_name, salary
ORDER BY MAX(salary) DESC
LIMIT 1;


SELECT CONCAT(e.first_name, ' ', e.last_name) AS "Employee_name", 
d.dept_name as "Department_name",
CONCAT(e1.first_name, ' ', e1.last_name) as 'Manager_name'
FROM employees as e
JOIN dept_emp as de
  	ON de.emp_no = e.emp_no
JOIN departments as d
  	ON d.dept_no = de.dept_no
JOIN dept_manager as dm
  	ON dm.dept_no = de.dept_no
JOIN employees as e1
	ON e1.emp_no = dm.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';
