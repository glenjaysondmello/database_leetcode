-- MySQL

-- Uses implicit boolean-to-integer conversion in AVG() to compute quality and poor query percentage concisely.
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(rating < 3) * 100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- PostgreSQL

-- Uses explicit casting and FILTER with COUNT for precise and more readable percentage calculation.
SELECT 
    query_name,
    ROUND(AVG(rating::NUMERIC / position), 2) AS quality,
    ROUND(
        COUNT(*) FILTER (WHERE rating < 3) * 100::NUMERIC / COUNT(*), 
    2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- Uses explicit numeric casting and boolean-to-integer conversion with AVG() to concisely compute both quality and poor query percentage.
SELECT 
    query_name,
    ROUND(AVG(rating::NUMERIC / position), 2) AS quality,
    ROUND(AVG((rating < 3)::INT) * 100.0, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- Example 1:

-- Input: 
-- Queries table:
-- +------------+-------------------+----------+--------+
-- | query_name | result            | position | rating |
-- +------------+-------------------+----------+--------+
-- | Dog        | Golden Retriever  | 1        | 5      |
-- | Dog        | German Shepherd   | 2        | 5      |
-- | Dog        | Mule              | 200      | 1      |
-- | Cat        | Shirazi           | 5        | 2      |
-- | Cat        | Siamese           | 3        | 3      |
-- | Cat        | Sphynx            | 7        | 4      |
-- +------------+-------------------+----------+--------+

-- Output: 
-- +------------+---------+-----------------------+
-- | query_name | quality | poor_query_percentage |
-- +------------+---------+-----------------------+
-- | Dog        | 2.50    | 33.33                 |
-- | Cat        | 0.66    | 33.33                 |
-- +------------+---------+-----------------------+

-- Explanation: 
-- Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
-- Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

-- Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
-- Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33

