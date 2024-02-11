INSERT INTO person_discounts(id,person_id,pizzeria_id,discount)
SELECT ROW_NUMBER() OVER () AS id, temp.person_id, temp.pizzeria_id,
    CASE
        WHEN temp.counter_visits = 1 THEN 10.5
        WHEN temp.counter_visits = 2 THEN 22
    ELSE 30
END 
FROM (SELECT person_order.person_id, menu.pizzeria_id, COUNT(person_order.person_id) AS counter_visits FROM person_order
JOIN menu ON menu.id = person_order.menu_id
GROUP BY person_id, pizzeria_id
ORDER BY person_id, pizzeria_id) AS temp;
