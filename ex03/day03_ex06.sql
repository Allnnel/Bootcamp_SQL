SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_1, pizzeria2.name AS pizzeria_name_2, menu.price FROM menu
INNER JOIN menu menu2 ON menu.id != menu2.id 
AND menu.pizzeria_id > menu2.pizzeria_id 
AND menu.price = menu2.price 
AND menu.pizza_name = menu2.pizza_name
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
INNER JOIN pizzeria pizzeria2 ON menu2.pizzeria_id = pizzeria2.id
ORDER BY menu.pizza_name;
