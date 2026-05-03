CREATE PROCEDURE sp_employee_full_analysis
AS
BEGIN
    DECLARE @avg_salary DECIMAL(10,2);
    DECLARE @max_salary DECIMAL(10,2);
    DECLARE @min_salary DECIMAL(10,2);

    SET @avg_salary = (SELECT AVG(salary) FROM employees);
    SET @max_salary = (SELECT MAX(salary) FROM employees);
    SET @min_salary = (SELECT MIN(salary) FROM employees);

    SELECT * FROM employees WHERE salary > @avg_salary;
    SELECT * FROM employees WHERE salary < @avg_salary;

    SELECT * FROM employees WHERE salary = @max_salary;
    SELECT * FROM employees WHERE salary = @min_salary;

    SELECT d.department_name, COUNT(e.employee_id)
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name;
END;
