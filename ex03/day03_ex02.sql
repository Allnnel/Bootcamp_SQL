SELECT pizza_name, price, pizzeria.name FROM (
    SELECT id FROM menu
    EXCEPT 
    SELECT menu_id FROM person_order
) AS m
INNER JOIN menu ON m.id = menu.id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name, price;
