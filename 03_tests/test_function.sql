SELECT emp_id, first_name, fn_annual_salary(emp_id) AS annual_salary
FROM   employees
WHERE  fn_annual_salary(emp_id) > 1000000
ORDER  BY fn_annual_salary(emp_id) DESC