SELECT name AS customers
FROM Customers
WHERE id NOT IN (SELECT customerId
FROM Orders)

-- METHOD 2:
-- SELECT c.name AS customers
-- FROM Customers c
-- LEFT JOIN Orders o
-- ON c.id = o.customerId
-- WHERE customerId IS NULL

