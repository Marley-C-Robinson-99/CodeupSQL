-- Number one
CREATE TEMPORARY TABLE employees_with_departments as
SELECT e.first_name, e.last_name, d.dept_name FROM employees.employees as e
JOIN employees.departments as d
JOIN employees.dept_emp as de 
  ON de.dept_no = d.dept_no
  AND de.emp_no = e.emp_no;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(255);

SELECT * FROM employees_with_departments
LIMIT 20;

UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

ALTER TABLE employees_with_departments
DROP COLUMN first_name;

ALTER TABLE employees_with_departments
DROP COLUMN last_name;
-- better way to do number one
CREATE TEMPORARY TABLE employees_with_departments as
SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name, d.dept_name FROM employees.employees as e
JOIN employees.departments as d
JOIN employees.dept_emp as de 
  ON de.dept_no = d.dept_no
  AND de.emp_no = e.emp_no;
-- number two
DROP TABLE payment_change;
USE germain_1460;

CREATE TEMPORARY TABLE payment_change AS
SELECT *
FROM sakila.payment;

SELECT *
FROM payment_change;

ALTER TABLE payment_change ADD new_amount FLOAT (10,2);
UPDATE payment_change SET new_amount = (amount * 100);
ALTER TABLE payment_change DROP COLUMN amount;

SELECT *
FROM payment_change;

-- Number 3 
DROP TABLE avg_sal_dept;

CREATE TEMPORARY TABLE avg_sal_dept as
SELECT d.dept_name as 'dept_name',
AVG(s.salary) as "avg_dept_sal"
FROM employees.salaries as s
JOIN employees.dept_emp as de
  ON de.emp_no = s.emp_no
  AND de.to_date >= NOW()
  AND s.to_date >= NOW()
JOIN employees.departments as d
  ON d.dept_no = de.dept_no
GROUP BY dept_name;

SELECT * FROM avg_sal_dept;

ALTER TABLE avg_sal_dept ADD zscore float(10,3);

UPDATE avg_sal_dept SET zscore = ((avg_dept_sal - (SELECT avg(s.salary) FROM employees.salaries as s)) / (SELECT STDDEV(salaries.salary) FROM employees.salaries));