-- LOWER, UPPER, LENGTH
SELECT email, 
LOWER (email) AS lower_mail,
UPPER (email) AS upper_mail,
LENGTH (email) AS length_mail
FROM customer;

-- LOWER, UPPER, LENGTH CHALLENGE 
SELECT 
LOWER (first_name), LOWER (last_name)
FROM customer
WHERE LENGTH(first_name) > 10 OR LENGTH(last_name) > 10;

-- LEFT, RIGHT
SELECT first_name, last_name,
LEFT (first_name, 3),	
RIGHT (last_name, 4),
RIGHT(LEFT(first_name,3),1)
FROM customer

-- LEFT, RIGHT CHALLENGE
SELECT email,
RIGHT(email,5),
LEFT(RIGHT(email,4),1)
FROM customer;

-- CONCATENATE ||
SELECT customer_id, first_name, 
first_name || last_name AS full_name,
first_name || ' ' || last_name AS full_name,
FROM customer

-- CONCATENATE CHALLENGE
SELECT email,
LEFT(email,3) || '***' || RIGHT(email,20)
FROM customer

-- REPLACE 
SELECT email,
REPLACE(email, '.org', '.com') AS new_email
FROM customer;

-- POSITION
SELECT email,
POSITION('@' IN email),
LEFT(email, POSITION('@' IN email) - 1)
FROM customer

-- SUBSTRING
SELECT first_name,
-- RIGHT(LEFT(first_name),4), 3)
SUBSTRING(first_name FROM 2 FOR 3)
FROM customer;

SELECT email,
SUBSTRING(email FROM (POSITION('.' IN email) + 1) FOR POSITION('@' IN email) - POSITION('.' IN email) - 1 )
FROM customer;

-- SUBSTRING CHALLENGE
SELECT email,
last_name || ',' || SUBSTRING(email FROM 0 FOR POSITION('.' IN email))
FROM customer;

-- EXTRACT
-- Syntax:
SELECT EXTRACT (Field FROM date/time/interval);

SELECT EXTRACT(month FROM rental_date),
EXTRACT(year FROM rental_date),
EXTRACT(hour FROM rental_date)
FROM rental;

SELECT EXTRACT(month FROM rental_date), COUNT (*)
FROM rental
WHERE EXTRACT(year FROM rental_date) = '2020'
GROUP BY EXTRACT(month FROM rental_date);

-- EXTRACT CHALLENGE
SELECT EXTRACT(month FROM payment_date) AS month_of_year,
SUM(amount) AS total_amount
FROM payment
GROUP BY EXTRACT(month FROM payment_date)
ORDER BY SUM(amount) DESC;

SELECT EXTRACT(day FROM payment_date) AS day_of_week,
SUM(amount) AS total_amount
FROM payment
GROUP BY EXTRACT(day FROM payment_date)
ORDER BY SUM(amount) DESC;

SELECT customer_id, EXTRACT(week FROM payment_date),
SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id, EXTRACT(week FROM payment_date)
ORDER BY SUM(amount) DESC;

-- TO_CHAR
SELECT payment_date, EXTRACT(day FROM payment_date),
TO_CHAR(payment_date,'hh:mm:ss dd-mm-yyyy')
FROM payment

-- INTERVALS & Timestamp
SELECT current_date, current_timestamp;
SELECT 
customer_id,
rental_date,
return_date,
return_date - rental_date AS rental_day,
EXTRACT(DAY FROM return_date - rental_date)* 24 + EXTRACT (HOUR FROM return_date - rental_date) || ' hours' AS rental_hour 
FROM rental;

SELECT 
customer_id,
rental_date,
return_date,
EXTRACT(DAY FROM return_date - rental_date)* 24 + EXTRACT (HOUR FROM return_date - rental_date) || ' hours' AS rental_hour 
FROM rental
WHERE customer_id = 35;

SELECT 
customer_id,
ROUND(AVG(EXTRACT(DAY FROM return_date - rental_date)* 24 + EXTRACT (HOUR FROM return_date - rental_date)),2) || ' hours' AS avg_rental_hour
FROM rental
GROUP BY customer_id
ORDER BY AVG(EXTRACT(DAY FROM return_date - rental_date)* 24 + EXTRACT (HOUR FROM return_date - rental_date)) DESC;
