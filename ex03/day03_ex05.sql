SELECT name FROM pizzeria
WHERE id IN (
    SELECT pizzeria_id FROM person_visits
    WHERE person_id = 2
)
EXCEPT
SELECT name FROM pizzeria
WHERE id NOT IN (
    SELECT person_id FROM person_order
    WHERE person_id != 2
);
