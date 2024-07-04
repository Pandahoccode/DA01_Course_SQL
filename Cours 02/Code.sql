-- SELECT query (Chọn data mong muốn)
SELECT actor_id, first_name FROM actor;
SELECT actor_id AS dien_vien, first_name AS Ten_KH FROM actor;

-- SELECT CHALLENGE
SELECT * FROM customer;
SELECT  first_name AS Ho_KH, 
		last_name AS Ten_KH,
		email AS Mail_KH 
FROM customer;

-- ORDER BY query (Thứ tự)
SELECT * FROM actor
ORDER BY first_name ASC, actor_id DESC;

SELECT * FROM payment
ORDER BY customer_id , amount DESC, payment_date DESC;

-- DISTINCT (Các giá trị khác nhau trong cùng 1/ nhiều trường)
SELECT DISTINCT first_name
FROM actor
ORDER BY first_name;

-- DISTINCT CHALLENGE
SELECT DISTINCT amount FROM payment
ORDER BY amount DESC;

-- LIMIT (Giới hạn chọn)
SELECT * FROM PAYMENT 
LIMIT 15;

-- WHERE (Vị trí chọn)
SELECT * FROM payment
WHERE amount >= 10.99;

SELECT * FROM actor
WHERE first_name IS NULL;

-- WHERE CHALLENGE
SELECT payment_id, amount FROM payment
WHERE amount <= 2
ORDER BY amount DESC;

-- AND/OR 
SELECT * FROM payment
WHERE amount >= 9 AND amount <= 4;

SELECT * FROM payment
WHERE amount >= 8 OR amount <= 3;

-- AND/OR CHALLENGE
SELECT * FROM payment
WHERE (customer_id = 322 OR customer_id = 346 OR customer_id = 354 )
AND (amount < 2 OR amount > 10)
ORDER BY customer_id ASC, amount DESC;

-- BETWEEN 
SELECT * FROM payment
-- (WHERE amount >= 2 AND amount >=9)
	WHERE amount BETWEEN 2 AND 9;

-- IN 
SELECT * FROM payment
--	(WHERE payment_id = 16055 OR payment_id = 16057 OR payment_id = 16061)
	 WHERE payment_id IN (16055, 16057, 16061);

-- IN CHALLENGE 
SELECT * FROM payment
WHERE customer_id IN (12,25,67,93,124,234)
AND amount IN (4.99, 7.99, 9.99)
AND payment_date BETWEEN '2020-01-01' AND '2020-02-01'; -- DATE TIME MUST BE STRING

-- LIKE 
SELECT * FROM actor
WHERE first_name LIKE 'N%' -- Name start with N
OR first_name LIKE '%N'-- Name ends with N
OR first_name LIKE '%N%' -- Name has N
OR first_name LIKE '__N%'; -- Name has the 3rd char is N

SELECT * FROM customer
WHERE (last_name LIKE 'J%' AND last_name LIKE 'S%');

-- LIKE CHALLENGE
-- 1
SELECT * FROM film
WHERE description LIKE '%Saga%' AND (title LIKE 'A%' OR title LIKE '%R');

-- 2
SELECT * FROM customer
WHERE first_name LIKE '%ER%' AND first_name LIKE '_A%';
