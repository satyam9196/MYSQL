# Function Question

Create database cool;

use cool;
# Function to calculate annual salary.
# -- Create table

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  name VARCHAR(50),
  monthly_salary DECIMAL(10,2),
  birth_date DATE,
  age INT
);

INSERT INTO employees(emp_id, name, monthly_salary, birth_date, age)
VALUES
  (1, 'A', 35000.00, '2003-07-24', 32),
  (2, 'B', 4700.00, '2004-02-21', 29),
  (3, 'C', 3300.00, '2001-02-22', 47),
  (4, 'D', 5600.00, '2004-07-20', 37);
  
  select * from employees;

# -- Define function correctly


DELIMITER //

CREATE FUNCTION get_annual_salary(monthly DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN monthly * 12;
END //

DELIMITER ;

# -- Use the function
SELECT name, get_annual_salary(monthly_salary) AS annual_salary
FROM employees;


# Function to check if number is even.

delimiter //
Create Function is_even(n int)
Returns Varchar(10)
Deterministic
Begin
	Return if(n%2=0, "Even", "Odd");
End //

delimiter ;

select emp_id, name, is_even(emp_id) as emp_id_type
from employees;

# Function to calculate tax.
delimiter //
create function cal_tax(salary decimal(10,2))
returns decimal(10,2)
deterministic
begin 
	return salary*0.1;
End //

delimiter ;
select name, monthly_salary, cal_tax(monthly_salary) as tax 
from employees;

SHOW FUNCTION STATUS WHERE name = 'cal_tax';
SHOW FUNCTION STATUS WHERE name = 'cal_tax';