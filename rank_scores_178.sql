SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS "Rank"
FROM Scores

--METHOD 2:
-- SELECT s1.score, (SELECT COUNT(DISTINCT s2.score) 
-- FROM Scores s2
-- WHERE s2.score > s1.score) + 1 AS "Rank"
-- FROM Scores s1
-- ORDER BY s1.score DESC

