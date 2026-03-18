-- MySQL
-- Uses IF() inside aggregation to pivot rows into columns for each month in a MySQL-specific way.
SELECT id,
    MAX(IF(month='Jan', revenue, null)) AS Jan_Revenue,
    MAX(IF(month='Feb', revenue, null)) AS Feb_Revenue,
    MAX(IF(month='Mar', revenue, null)) AS Mar_Revenue,
    MAX(IF(month='Apr', revenue, null)) AS Apr_Revenue,
    MAX(IF(month='May', revenue, null)) AS May_Revenue,
    MAX(IF(month='Jun', revenue, null)) AS Jun_Revenue,
    MAX(IF(month='Jul', revenue, null)) AS Jul_Revenue,
    MAX(IF(month='Aug', revenue, null)) AS Aug_Revenue,
    MAX(IF(month='Sep', revenue, null)) AS Sep_Revenue,
    MAX(IF(month='Oct', revenue, null)) AS Oct_Revenue,
    MAX(IF(month='Nov', revenue, null)) AS Nov_Revenue,
    MAX(IF(month='Dec', revenue, null)) AS Dec_Revenue
FROM Department
GROUP BY id;

-- PostgreSQL / MySQL
-- Uses CASE WHEN inside aggregation to achieve the same pivot, making it more portable and standard-compliant.
SELECT id,
    MAX(CASE WHEN month='Jan' THEN revenue ELSE null END) AS Jan_Revenue,
    MAX(CASE WHEN month='Feb' THEN revenue ELSE null END) AS Feb_Revenue,
    MAX(CASE WHEN month='Mar' THEN revenue ELSE null END) AS Mar_Revenue,
    MAX(CASE WHEN month='Apr' THEN revenue ELSE null END) AS Apr_Revenue,
    MAX(CASE WHEN month='May' THEN revenue ELSE null END) AS May_Revenue,
    MAX(CASE WHEN month='Jun' THEN revenue ELSE null END) AS Jun_Revenue,
    MAX(CASE WHEN month='Jul' THEN revenue ELSE null END) AS Jul_Revenue,
    MAX(CASE WHEN month='Aug' THEN revenue ELSE null END) AS Aug_Revenue,
    MAX(CASE WHEN month='Sep' THEN revenue ELSE null END) AS Sep_Revenue,
    MAX(CASE WHEN month='Oct' THEN revenue ELSE null END) AS Oct_Revenue,
    MAX(CASE WHEN month='Nov' THEN revenue ELSE null END) AS Nov_Revenue,
    MAX(CASE WHEN month='Dec' THEN revenue ELSE null END) AS Dec_Revenue
FROM Department
GROUP BY id;

-- PostgreSQL
-- Uses FILTER clause with aggregation to pivot monthly revenue, providing a cleaner and more concise PostgreSQL-specific solution.
SELECT id,
    MAX(revenue) FILTER (WHERE month='Jan') AS Jan_Revenue,
    MAX(revenue) FILTER (WHERE month='Feb') AS "Feb_Revenue",
    MAX(revenue) FILTER (WHERE month='Mar') AS "Mar_Revenue",
    MAX(revenue) FILTER (WHERE month='Apr') AS "Apr_Revenue",
    MAX(revenue) FILTER (WHERE month='May') AS "May_Revenue",
    MAX(revenue) FILTER (WHERE month='Jun') AS "Jun_Revenue",
    MAX(revenue) FILTER (WHERE month='Jul') AS "Jul_Revenue",
    MAX(revenue) FILTER (WHERE month='Aug') AS "Aug_Revenue",
    MAX(revenue) FILTER (WHERE month='Sep') AS "Sep_Revenue",
    MAX(revenue) FILTER (WHERE month='Oct') AS "Oct_Revenue",
    MAX(revenue) FILTER (WHERE month='Nov') AS "Nov_Revenue",
    MAX(revenue) FILTER (WHERE month='Dec') AS "Dec_Revenue"
FROM Department
GROUP BY id;

-- Example 1:

-- Input: 
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- Output: 
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- Explanation: The revenue from Apr to Dec is null.
-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

