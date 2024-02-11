CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit(row_id, type_event, name, age, gender, address)
    VALUES (OLD.id, 'D', OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;


CREATE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SET enable_seqscan = off;
EXPLAIN ANALYZE 
SELECT pizzeria_id, pizza_nameFROM menu
WHERE pizza_name = 'Dominos';


CREATE INDEX  idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name FROM menu 
WHERE pizzeria_id = 8;