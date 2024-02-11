-- Установливаем уровень изоляции для обоих сеансов на LEVEL SERIALIZABLE. 
-- LEVEL SERIALIZABLE Гарантирует абсолютную изоляцию транзакций. Это означает, 
-- что параллельное выполнение нескольких транзакций не приведет к конфликтам и сохранению несогласованных данных. 
-- Каждая транзакция ведет себя так, как если бы она была выполнена последовательно.
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- В сеансе 1 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 обновим рейтинг "Pizza Hut" на значение 3.0:
UPDATE pizzeria SET rating = 3.0  WHERE name = 'Pizza Hut';
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