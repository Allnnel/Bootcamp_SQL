 SELECT object_name FROM (
     SELECT pizza_name AS object_name, 'menu' AS sort FROM menu
     UNION ALL SELECT name, 'person' AS sort FROM person
     ORDER BY sort desc, object_name
 ) object_name;
