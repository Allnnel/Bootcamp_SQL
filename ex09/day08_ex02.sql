BEGIN; 
 -- устанавливаем на 2 сессиях REPEATABLE READ уровень изоляции.
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- REPEATABLE READ Гарантирует, что данные, прочитанные в рамках транзакции, останутся постоянными до ее завершения. 
-- Это означает, что другие транзакции не смогут изменять или удалять эти данные до того, как текущая транзакция будет завершена.
-- проверяем на двух сессиях значения 
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; 
-- устанавливаем рейтинг 4 на 1 сессии
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; 
 -- устанавливаем рейтинг 3.6  на 2 сессии
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
 -- комитим на двух сессиях
COMMIT;
-- так как режим изоляции REPEATABLE READ устанавливается комит сделанный раньше, то есть 1 сессии, у второй сессии появляется ошибка
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; 