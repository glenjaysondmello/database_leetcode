-- CASE approach: Uses SQL CASE for clear, structured conditional swapping of adjacent seat IDs.
SELECT
CASE
    WHEN id = (SELECT MAX(id) FROM Seat) AND id % 2 = 1
        THEN id
    WHEN id % 2 = 0
        THEN id - 1
    ELSE id + 1
END AS id,
student
FROM Seat
ORDER BY id;

-- IF approach: Uses nested IF() for compact conditional swapping of adjacent seat IDs in MySQL.
SELECT
IF(id = (SELECT MAX(id) FROM Seat) AND id % 2 = 1,
    id,
    IF(id % 2 = 0, id - 1, id + 1)
) AS id, student
FROM Seat
ORDER BY id;

-- Example 1:

-- Input: 
-- Seat table:
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Abbot   |
-- | 2  | Doris   |
-- | 3  | Emerson |
-- | 4  | Green   |
-- | 5  | Jeames  |
-- +----+---------+
-- Output: 
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Doris   |
-- | 2  | Abbot   |
-- | 3  | Green   |
-- | 4  | Emerson |
-- | 5  | Jeames  |
-- +----+---------+
-- Explanation: 
-- Note that if the number of students is odd, there is no need to change the last one's seat.


