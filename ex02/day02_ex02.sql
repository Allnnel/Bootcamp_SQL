SELECT
  COALESCE(pers.name, '-') AS person_name,
  DATE(dates.visit_date) AS visit_date,
  COALESCE(pizz.name, '-') AS pizzeria_name
FROM
  (SELECT DISTINCT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS dates
FULL JOIN (
    SELECT name, id AS pers_name, id FROM person
    ) AS pers ON pers.id = dates.person_id
FULL JOIN (
    SELECT name, id AS pizz_name, id FROM pizzeria
    ) AS pizz ON pizz.id = dates.pizzeria_id
ORDER BY
  person_name, visit_date, pizzeria_name;
