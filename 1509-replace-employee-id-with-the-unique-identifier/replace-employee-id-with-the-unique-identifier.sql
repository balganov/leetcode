-- Write your PostgreSQL query statement below
select unique_id, name
from EmployeeUNI eu
RIGHT JOIN Employees e ON eu.id = e.id