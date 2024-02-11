WITH RECURSIVE finder
AS (SELECT point2 ,
 ('{' || point1) AS tour,
 cost AS total_cost
FROM nodes WHERE point1 = 'a'
UNION ALL
   SELECT nodes.point2,
   (finder.tour || ',' || nodes.point1) AS tour,
   finder.total_cost + nodes.cost AS total_cost
   FROM nodes
   JOIN finder ON  finder.point2 = nodes.point1
  WHERE tour NOT LIKE ('%' || nodes.point1 || '%')
),
result AS (SELECT total_cost, (tour || ',a}') AS tour FROM finder WHERE point2 = 'a'  AND LENGTH(tour) = 8 ),
min_result AS (SELECT *  FROM result WHERE total_cost = (SELECT MIN(total_cost) FROM result)),
max_result AS (SELECT *  FROM result WHERE total_cost = (SELECT MAX(total_cost) FROM result))
SELECT * FROM min_result
UNION 
SELECT * FROM max_result
ORDER BY total_cost, tour;
