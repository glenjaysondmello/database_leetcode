SELECT *,
IF(t.x + t.y > t.z AND t.y + t.z > t.x AND t.x + t.z > t.y, "Yes", "No") AS triangle
FROM Triangle t;
