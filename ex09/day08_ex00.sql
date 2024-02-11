BEGIN; -- сессия 1
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- сессия 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; -- сессия 1

-- после update в таблице 1 сессии рейтинг изменился 
--  rating 
-- -------- 
--       5
-- (1 row)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- сессия 2

-- после update, в таблице 2 сессии рейтинг не изменился 
--  rating 
-- -------- 
--     4.6
-- (1 row)


COMMIT; -- комитим данные в 1 сессии 

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- сессия 2

-- после выполнение команды COMMIT, данные во 2 сессии изменились 
--  rating 
-- -------- 
--       5
-- (1 row)
