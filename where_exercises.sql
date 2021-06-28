SHOW databases;
USE employees;
SHOW TABLES;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
#709 Rows
SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';
#709 Rows
SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
AND gender = 'M';
#619 Rows
SELECT DISTINCT * FROM employees
WHERE last_name LIKE 'E%';
#7330 rows
SELECT * FROM employees
WHERE last_name LIKE '%e';
#24292 Rows
#Togther
SELECT * FROM employees
WHERE last_name LIKE "E%"
OR last_name LIKE '%e';
#30723 Rows
SELECT * FROM employees
WHERE last_name LIKE "E%"
AND last_name LIKE '%e';
#899 Rows for both
#6431 Row diff

SELECT * FROM employees
WHERE hire_date BETWEEN 1990 AND 2000;
#0 hires in the 90s
SELECT * FROM employees
WHERE birth_date LIKE '%12-25';
#842 Rows
SELECT * FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN 1990 AND 2000;
#0 rows
SELECT * FROM employees
WHERE last_name LIKE "%q%";
#1873 Rows
SELECT * FROM employees
WHERE last_name LIKE "%q%"
AND NOT last_name LIKE "%qu%";
#547 Rows