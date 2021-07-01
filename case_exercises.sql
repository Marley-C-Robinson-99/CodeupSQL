USE employees;
SELECT de.emp_no,
    MAX(dnum.dept_no) as "Department Number",
    MIN(de.from_date) as "Start Date", MAX(de.to_date) as "End Date",
    IF (MAX(de.to_date) > NOW(), TRUE, FALSE) is_current_employee
FROM dept_emp as de
LEFT JOIN (SELECT dept_no, emp_no FROM dept_emp
WHERE to_date = (SELECT MAX(to_date) FROM dept_emp)) as dnum using (emp_no)
GROUP BY emp_no;



SELECT first_name, last_name,
	CASE 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' and 'H' THEN 'A-H' 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' and 'Q' THEN 'I-Q'
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' and 'Z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;

select concat(substring(birth_date,1,3), "0's") as year, count(*) as count
from employees
group by year;

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
WHERE salaries.to_date = '9999-01-01'
GROUP BY dept_group
ORDER BY avg_sal desc;
