-- Uses a subquery with a window function to compute cumulative weight and directly filter the last valid person.
SELECT person_name
FROM (
    SELECT person_name, SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
) AS t
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC
LIMIT 1;

-- Uses a CTE (WITH clause) for better readability while performing the same cumulative sum logic.
WITH New_table AS (
    SELECT person_name, SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
)

SELECT person_name
FROM New_table
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC
LIMIT 1;

-- Example 1:

-- Input: 
-- Queue table:
-- +-----------+-------------+--------+------+
-- | person_id | person_name | weight | turn |
-- +-----------+-------------+--------+------+
-- | 5         | Alice       | 250    | 1    |
-- | 4         | Bob         | 175    | 5    |
-- | 3         | Alex        | 350    | 2    |
-- | 6         | John Cena   | 400    | 3    |
-- | 1         | Winston     | 500    | 6    |
-- | 2         | Marie       | 200    | 4    |
-- +-----------+-------------+--------+------+

-- Output: 
-- +-------------+
-- | person_name |
-- +-------------+
-- | John Cena   |
-- +-------------+

-- Explanation: The folowing table is ordered by the turn for simplicity.
-- +------+----+-----------+--------+--------------+
-- | Turn | ID | Name      | Weight | Total Weight |
-- +------+----+-----------+--------+--------------+
-- | 1    | 5  | Alice     | 250    | 250          |
-- | 2    | 3  | Alex      | 350    | 600          |
-- | 3    | 6  | John Cena | 400    | 1000         | (last person to board)
-- | 4    | 2  | Marie     | 200    | 1200         | (cannot board)
-- | 5    | 4  | Bob       | 175    | ___          |
-- | 6    | 1  | Winston   | 500    | ___          |
-- +------+----+-----------+--------+--------------+

