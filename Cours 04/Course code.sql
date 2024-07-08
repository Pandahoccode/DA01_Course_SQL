-- AGGREGATE FUNCTIONS
SELECT 
MAX (amount) AS max_amount, -- return max variable in table
MIN (amount) AS min_amount, -- return min variable in table
SUM (amount) AS total_amount, -- return sum of variables in table
AVG (amount) AS average_amount, -- caculate average of variaables in table
COUNT (*) AS total_record,
COUNT (DISTINCT customer_id) AS total_record_customer
FROM payment
WHERE payment_date BETWEEN '2020-01-01' AND '2020-02-01'
AND amount > 0;

-- GROUP BY 
-- syntax:
SELECT col1, col2 -- most 2 column 
SUM (),
AVG (),
MIN (),
MAX (),
FROM table_nm
GROUP BY col1, col2
	
-------------------------------
SELECT customer_id, staff_id,
SUM (amount) AS total_amount,
MAX (amount) AS max_amount,
MIN (amount) AS min_amount, 
SUM (amount) AS total_amount,
AVG (amount) AS average_amount,
COUNT (*) AS count_rental
FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id;

-- GROUP BY CHALLENGE
SELECT film_id,
MAX (replacement_cost) as max_cost,
MIN (replacement_cost) as min_cost,
SUM (replacement_cost) as total_cost,
ROUND(AVG (replacement_cost),2) as avg_cost
FROM film
GROUP BY film_id
ORDER BY film_id;

-- HAVING
SELECT customer_id, 
SUM(amount) as total_amount 
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100; 

-- HAVING vs WHERE
-- HAVING ĐỨNG SAU GROUP BY DÙNG ĐỂ TỔNG HỢP DATA SAU KHI DATA ĐÃ ĐƯỢC LỌC
SELECT * FROM payment;
-- HAVING CHALLENGE
SELECT customer_id, DATE(payment_date),
ROUND(AVG(amount),2) AS avg_payment,
COUNT (payment_id) AS count_payment
FROM payment 
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29','2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(payment_id) > 1
ORDER BY ROUND(AVG(amount),2) DESC;

-- MATH OPERATORS & FUNCTIONS
SELECT 
3 + 7,
3 - 7,
3 * 7,
7 / 3,
7 % 3,
7 ^ 3;

SELECT 
ABS(-7),
ROUND(7.999999,2),
CEILING(7.999999),
FLOOR(7.999999);

-- MATH OPERATORS & FUNCTIONS CHALLENGE
SELECT 
film_id,
rental_rate,
replacement_cost,
ROUND((rental_rate/ replacement_cost * 100),2) AS percentage
FROM film
WHERE (rental_rate/ replacement_cost * 100) < 4;

-- ORDER
=> SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT 