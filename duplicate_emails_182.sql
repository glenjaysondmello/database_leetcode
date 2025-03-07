SELECT DISTINCT p1.email
FROM Person p1 
JOIN Person p2 
ON p1.email = p2.email AND p1.id != p2.id

-- METHOD 2:
-- SELECT email
-- FROM (SELECT email, COUNT(email) AS c
-- FROM Person
-- GROUP BY email) AS Temp
-- WHERE c > 1

-- METHOD 3:
-- SELECT email
-- FROM Person
-- GROUP BY email
-- HAVING COUNT(email) > 1
