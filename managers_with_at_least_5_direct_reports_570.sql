-- Using JOIN
SELECT e1.name FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e2.managerId
HAVING COUNT(e2.managerId) >= 5;

-- Using IN
SELECT e.name FROM Employee e
WHERE e.id IN (
    SELECT e.managerId FROM Employee e
    GROUP BY e.managerId
    HAVING COUNT(*) >= 5
);
