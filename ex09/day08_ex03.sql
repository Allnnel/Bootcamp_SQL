-- Установливаем уровень изоляции для обоих сеансов на READ COMMITTED. 
-- READ COMMITTED Гарантирует, что данные, прочитанные в рамках транзакции, будут актуальными на момент чтения. 
-- Это означает, что если другая транзакция изменяет или удаляет данные, прочитанные текущей транзакцией, то последняя получит новые значения данных при повторном чтении.
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- В сеансе 1 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 обновим рейтинг "Pizza Hut" на значение 3.6:
UPDATE pizzeria SET rating = 3.6  WHERE name = 'Pizza Hut';
-- В сеансе 1 снова проверем рейтинг для "Pizza Hut" и комитим 2 сеанс:
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';  -- здесь значение изменилось 
-- Комитим 1 сеанс
COMMIT;
-- В сеансе 1 снова проверем рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';