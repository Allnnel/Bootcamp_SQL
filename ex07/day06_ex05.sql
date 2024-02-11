COMMENT ON TABLE person_discounts IS 'This table stores information about discounts given to persons at various pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'Id';
COMMENT ON COLUMN person_discounts.person_id IS 'The ID of the person who received the discount. References the person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The ID of the pizzeria where the discount was given. References the pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'The percentage of discount given to the person. Can range from 0 to 100';
