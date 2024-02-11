WITH visits AS (
            (
                SELECT pizzeria.name, COUNT(person_order.id), 'order' AS action_type FROM person_order 
                JOIN menu ON menu.id = person_order.menu_id 
                RIGHT JOIN pizzeria on pizzeria.id = menu.pizzeria_id
                GROUP BY pizzeria.name ORDER BY 2 desc
            )      
    UNION ALL
            (
                SELECT  pizzeria.name,  COUNT(person_visits.id), 'visit' AS action_type FROM person_visits 
                RIGHT JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id 
                GROUP BY pizzeria.name 
                ORDER BY 2 DESC
            )
     ORDER BY action_type, 2 DESC
     )
SELECT name, SUM(count) FROM visits
GROUP BY name
ORDER BY 2 DESC, 1;
