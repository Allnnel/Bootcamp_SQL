-- Установливаем уровень изоляции для обоих сеансов на LEVEL REPEATABLE READ
-- LEVEL REPEATABLE READ Гарантирует, что при повторном чтении данных в рамках одной транзакции, результаты чтения будут одинаковыми. 
-- Другими словами, данные, которые были прочитаны в начале транзакции, не будут изменены другими транзакциями до её завершения. 
-- Это предотвращает появление "фантомных" записей.
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN; -- session 1, 2
UPDATE pizzeria SET rating = 0.1  WHERE id = 1; -- session 1
UPDATE pizzeria SET rating = 0.2  WHERE id = 2; -- session 2
UPDATE pizzeria SET rating = 0.2  WHERE id = 2; -- session 1
UPDATE pizzeria SET rating = 0.1  WHERE id = 1; -- session 2
COMMIT; -- session 1, 2