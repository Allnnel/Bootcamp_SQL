SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE pizzeria_id = 1;
CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE pizzeria_id = 1;
