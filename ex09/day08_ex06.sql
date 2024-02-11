-- Установливаем уровень изоляции для обоих сеансов на REPEATABLE READ. 
-- REPEATABLE READ Гарантирует, что данные, прочитанные в рамках транзакции, останутся постоянными до ее завершения. 
-- Это означает, что другие транзакции не смогут изменять или удалять эти данные до того, как текущая транзакция будет завершена.
-- проверяем на двух сессиях значения 
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- В сеансе 1 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 обновим рейтинг "Pizza Hut" на значение 3.0:
UPDATE pizzeria SET rating = 5  WHERE name = 'Pizza Hut';
-- Комитим 2 сеанс
COMMIT;
-- В сеансе 1 снова проверем рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; -- значение осталось 3.6
-- Комитим 1 сеанс
COMMIT;
-- В сеансе 1 снова проверем рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; 
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';