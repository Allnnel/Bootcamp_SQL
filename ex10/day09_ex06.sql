
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy', pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE(name    varchar) AS $$
BEGIN
    RETURN QUERY
    SELECT pizzeria.name AS pizzeria_name FROM menu 
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_visits ON menu.pizzeria_id = person_visits.pizzeria_id
    INNER JOIN person ON person.id = person_visits.person_id
    WHERE menu.price < pprice AND person.name = pperson AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');     
