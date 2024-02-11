SELECT menu.pizza_name, name AS pizzeria_name, menu.price FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pizza_name, name;
