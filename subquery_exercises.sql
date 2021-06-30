USE employees;

SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE hire_date IN (
	SELECT from_date 
	FROM dept_emp
	WHERE emp_no = 101010
);

SELECT distinct title
FROM titles
WHERE emp_no IN (
	SELECT emp_no 
	FROM employees
	WHERE first_name = 'Aamod'
);

SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_emp
	WHERE to_date != "9999-01-01"
);

SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_manager
	WHERE to_date = "9999-01-01"
) AND gender = "F";

SELECT * FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries 
	WHERE salary > (
		SELECT avg(salary) FROM salaries WHERE to_date >= NOW()
	)
);

SELECT * FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries 
	WHERE salary IN (
		SELECT STD(salary)
		FROM salaries
		GROUP BY salary
		 HAVING std(salary) BETWEEN 0 AND 1
	)
);
	