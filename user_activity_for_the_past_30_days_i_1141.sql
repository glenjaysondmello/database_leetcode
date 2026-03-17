-- MySQL
-- Uses MySQL’s DATE_SUB function with INTERVAL to explicitly subtract 29 days from the given date, making it clear and MySQL-friendly.
SELECT activity_date as day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date
BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;

-- PostgreSQL

-- Uses explicit INTERVAL syntax for date subtraction, making it the most standard and portable approach.
SELECT activity_date as day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date
BETWEEN '2019-07-27'::DATE - INTERVAL '29 DAY' AND '2019-07-27'::DATE
GROUP BY activity_date;

-- Uses implicit integer subtraction on a date, which works in some SQL dialects (like PostgreSQL) but is less explicit.
SELECT activity_date as day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date
BETWEEN '2019-07-27'::DATE - 29 AND '2019-07-27'::DATE
GROUP BY activity_date;

-- Uses SQL standard DATE literal with integer subtraction, offering cleaner and more readable syntax.
SELECT activity_date as day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date
BETWEEN DATE '2019-07-27' - 29 AND DATE '2019-07-27'
GROUP BY activity_date;

-- Example 1:

-- Input: 
-- Activity table:
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | 1       | 1          | 2019-07-20    | open_session  |
-- | 1       | 1          | 2019-07-20    | scroll_down   |
-- | 1       | 1          | 2019-07-20    | end_session   |
-- | 2       | 4          | 2019-07-20    | open_session  |
-- | 2       | 4          | 2019-07-21    | send_message  |
-- | 2       | 4          | 2019-07-21    | end_session   |
-- | 3       | 2          | 2019-07-21    | open_session  |
-- | 3       | 2          | 2019-07-21    | send_message  |
-- | 3       | 2          | 2019-07-21    | end_session   |
-- | 4       | 3          | 2019-06-25    | open_session  |
-- | 4       | 3          | 2019-06-25    | end_session   |
-- +---------+------------+---------------+---------------+

-- Output: 
-- +------------+--------------+ 
-- | day        | active_users |
-- +------------+--------------+ 
-- | 2019-07-20 | 2            |
-- | 2019-07-21 | 2            |
-- +------------+--------------+ 

-- Explanation: Note that we do not care about days with zero active users.


