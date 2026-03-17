-- Approach 1: Uses a subquery to check whether a node appears as a parent (p_id) to classify nodes as Root, Inner, or Leaf
SELECT id, (
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (
            SELECT p_id
            FROM Tree
            WHERE p_id IS NOT NULL
        )
        THEN 'Inner'
        ELSE 'Leaf'
    END
) AS type
FROM Tree;

-- Approach 2: Uses a self LEFT JOIN to determine if a node has children (via join match) and classify it accordingly.
SELECT DISTINCT t1.id, (
    CASE 
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t1.id IS NOT NULL AND t2.id IS NOT NULL THEN 'Inner'
        WHEN t1.id IS NOT NULL AND t2.p_id IS NULL THEN 'Leaf'
    END
) AS type
FROM Tree t1 LEFT JOIN Tree t2
ON t1.id = t2.p_id;

-- Example 1:

-- Input: 
-- Tree table:
-- +----+------+
-- | id | p_id |
-- +----+------+
-- | 1  | null |
-- | 2  | 1    |
-- | 3  | 1    |
-- | 4  | 2    |
-- | 5  | 2    |
-- +----+------+

-- Output: 
-- +----+-------+
-- | id | type  |
-- +----+-------+
-- | 1  | Root  |
-- | 2  | Inner |
-- | 3  | Leaf  |
-- | 4  | Leaf  |
-- | 5  | Leaf  |
-- +----+-------+

-- Explanation: 
-- Node 1 is the root node because its parent node is null and it has child nodes 2 and 3.
-- Node 2 is an inner node because it has parent node 1 and child node 4 and 5.
-- Nodes 3, 4, and 5 are leaf nodes because they have parent nodes and they do not have child nodes.

-- Example 2:

-- Input: 
-- Tree table:
-- +----+------+
-- | id | p_id |
-- +----+------+
-- | 1  | null |
-- +----+------+

-- Output: 
-- +----+-------+
-- | id | type  |
-- +----+-------+
-- | 1  | Root  |
-- +----+-------+

-- Explanation: If there is only one node on the tree, you only need to output its root attributes.

