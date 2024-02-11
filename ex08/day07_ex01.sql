SELECT person.name, COUNT(person_visits.id) AS visit_count FROM person
JOIN person_visits ON person.id = person_visits.person_id
GROUP BY person.id, person.name
ORDER BY visit_count DESC, person.name 
LIMIT 4;
