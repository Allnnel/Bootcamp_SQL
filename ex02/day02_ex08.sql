SELECT DISTINCT name FROM person
INNER JOIN person_order ON person.id = person_order.menu_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'male' 
AND (person.address = 'Moscow' OR person.address = 'Samara') 
AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza') 
ORDER BY name DESC;
