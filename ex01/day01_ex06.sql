SELECT order_date AS action_date, (
    SELECT name FROM person
    WHERE person_id = person.id
    ) AS person_name FROM person_order
INTERSECT ALL SELECT visit_date, (
    SELECT name FROM person
    WHERE person_id = person.id
) FROM person_visits
ORDER BY action_date, person_name DESC;
