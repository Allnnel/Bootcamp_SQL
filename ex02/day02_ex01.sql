WITH dates AS  (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS visit
) 
    SELECT DATE(visit) AS missing_date FROM dates
    LEFT JOIN (
        SELECT DISTINCT visit_date FROM person_visits
        WHERE person_id = 1 OR person_id = 2
    ) AS visit ON DATE(visit) = DATE(visit.visit_date)
    WHERE visit.visit_date is null
    ORDER BY missing_date;
