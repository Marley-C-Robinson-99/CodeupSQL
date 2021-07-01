USE employees;
-- 1
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE hire_date IN (
	SELECT from_date 
	FROM dept_emp
	WHERE emp_no = 101010
);
-- 2
SELECT distinct title
FROM titles
WHERE emp_no IN (
	SELECT emp_no 
	FROM employees
	WHERE first_name = 'Aamod'
);
-- 3
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_emp
	WHERE to_date != "9999-01-01"
);
-- 4
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_manager
	WHERE to_date = "9999-01-01"
) AND gender = "F";
-- 5
SELECT * FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries 
	WHERE salary > (
		SELECT avg(salary) FROM salaries
	) AND to_date >= NOW()
);
-- 6

SELECT COUNT(*)
	FROM salaries
	WHERE to_date >= NOW()
	AND salary >(SELECT MAX(salary) - std(salary) FROM salaries WHERE to_date >= NOW());


SELECT COUNT(*) AS within_1_std
FROM salaries 
JOIN dept_emp 
	ON dept_emp.emp_no = salaries.emp_no
	AND salaries.to_date >= NOW()
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
	AND dept_emp.to_date >= NOW()
WHERE salary >=
(
	SELECT MAX(salary)
	FROM salaries 
	JOIN dept_emp
	 ON dept_emp.emp_no = salaries.emp_no
	 AND salaries.to_date >= NOW()
	JOIN departments
	 ON departments.dept_no = dept_emp.dept_no
	 AND dept_emp.to_date >= NOW()
)
-    
(
SELECT STDDEV(salary)
FROM salaries 
JOIN dept_emp
	ON dept_emp.emp_no = salaries.emp_no
	AND salaries.to_date >= NOW()
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
	AND dept_emp.to_date >= NOW()
);
-- Bonus Questions
SELECT dept_name FROM departments
WHERE dept_no in (
		SELECT dept_no FROM dept_manager
		WHERE to_date >= NOW() AND emp_no IN(
			SELECT emp_no FROM employees
			WHERE gender = 'F'
		)
	);
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries
	WHERE salary in (
		SELECT MAX(SALARY)
		from salaries)
);
SELECT dept_name FROM departments
WHERE dept_no IN(
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no in (
		SELECT emp_no
		FROM salaries
		WHERE salary in (
			SELECT MAX(SALARY)
			FROM salaries
			) 
		)
	);