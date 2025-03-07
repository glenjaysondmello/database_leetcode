SELECT MAX(salary) as SecondHighestSalary
FROM Employee
WHERE salary NOT IN (SELECT MAX(salary) from Employee)

-- METHOD 2:
-- SELECT (SELECT DISTINCT salary
-- FROM Employee
-- ORDER BY salary DESC
-- LIMIT 1 OFFSET 1) as SecondHighestSalary

