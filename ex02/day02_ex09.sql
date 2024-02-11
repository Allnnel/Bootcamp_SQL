SELECT DISTINCT name FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female' AND pizza_name = 'pepperoni pizza'
INTERSECT 
SELECT DISTINCT name FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female' AND pizza_name = 'cheese pizza'
ORDER BY name;
