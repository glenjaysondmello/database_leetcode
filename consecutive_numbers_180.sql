SELECT DISTINCT a.num AS ConsecutiveNums
FROM Logs a 
JOIN Logs b ON a.id = b.id + 1 AND a.Num = b.Num
JOIN Logs c ON a.id = c.id + 2 AND a.Num = c.Num
