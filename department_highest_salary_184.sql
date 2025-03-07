SELECT d.name AS department, e.name AS employee, salary
FROM Employee e
JOIN Department d
ON e.departmentId = d.id
WHERE (departmentId, salary) IN
(SELECT departmentId, MAX(salary) 
FROM Employee
GROUP BY departmentId) 

