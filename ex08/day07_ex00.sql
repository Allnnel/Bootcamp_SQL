SELECT person_id, COUNT(*) AS visits_count FROM person_visits
GROUP BY person_id
ORDER BY visits_count DESC, person_id;
