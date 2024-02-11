-- на каждой ссесии запускаем в режим транзакции
BEGIN; 
-- на каждой ссесии выводим наш столбец
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; 
-- сначала запускаем на 1 сеcсии, далее на 2 сеcсии
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; 
-- комитм 1 сессию, далее 2 сеcсии
COMMIT;
-- видем что мы потеряли комит 1 ссесии 
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; 
