-- Установливаем уровень изоляции для обоих сеансов на READ COMMITTED. 
-- READ COMMITTED Гарантирует, что данные, прочитанные в рамках транзакции, будут актуальными на момент чтения. 
-- Это означает, что если другая транзакция изменяет или удаляет данные, прочитанные текущей транзакцией, то последняя получит новые значения данных при повторном чтении.
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;
--  сеансе 1 проверем текущий рейтинг для "Pizza Hut":
 SELECT SUM(rating) FROM pizzeria;
-- В сеансе 2 обновим рейтинг "Pizza Hut" на значение 1:
UPDATE pizzeria SET rating = 1  WHERE name = 'Pizza Hut';
-- Комитим 2 сеанс
COMMIT;
--В сеансе 1 снова проверем рейтинг для "Pizza Hut":
 SELECT SUM(rating) FROM pizzeria;  -- значение изменилось 
-- Комитим 1 сеанс
COMMIT;
-- В сеансе 1 снова проверем рейтинг для "Pizza Hut":
 SELECT SUM(rating) FROM pizzeria;
-- В сеансе 2 проверем текущий рейтинг для "Pizza Hut":
 SELECT SUM(rating) FROM pizzeria;