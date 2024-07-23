-- MID COURSE TEST
-- Question 1:
-- Task :
SELECT DISTINCT replacement_cost 
FROM film
ORDER BY replacement_cost

-- Question:
SELECT DISTINCT replacement_cost AS lowest_replacement
FROM film
ORDER BY replacement_cost
LIMIT 1;

-- Question 2:
SELECT CASE
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
	WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
	WHEN replacement_cost BETWEEN 25.00 AND 25.99 THEN 'high'
	ELSE 'others'
END category,
COUNT(*) AS number
FROM film
GROUP BY category
ORDER BY category;

-- Question 3:
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;

-- Task:
SELECT film.film_id, film.title, film.length, film_category.category_id, category.name
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Drama' OR category.name = 'Sports'

-- Question:
SELECT category.name,film.length
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Drama' OR category.name = 'Sports'
GROUP BY film.length, category.name
ORDER BY film.length DESC	
LIMIT 1;

-- Question 4:
-- Task:
SELECT category.name, COUNT(film_category.category_id)
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

-- Question:
SELECT category.name, COUNT(film_category.category_id)
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY COUNT(film_category.category_id) DESC
LIMIT 1;

-- Question 5:	
-- Question:
SELECT actor.first_name || ' ' || actor.last_name, 
COUNT(film_actor.film_id)
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
GROUP BY actor.first_name, actor.last_name;

-- Task: 
SELECT actor.first_name || ' ' || actor.last_name,
COUNT(film_actor.film_id)
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id 
GROUP BY actor.first_name, actor.last_name
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1;

-- Question 6:
SELECT *
FROM address
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE customer.customer_id IS NULL

SELECT COUNT(address.address) AS number
FROM address
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE customer.customer_id IS NULL


-- Question 7:
SELECT * FROM city;
SELECT * FROM customer;
SELECT * FROM  rental;

-- Task:
SELECT city.city, SUM(payment.amount) FROM payment
LEFT JOIN rental ON payment.rental_id = rental.rental_id
LEFT JOIN customer ON customer.customer_id = rental.customer_id
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON city.city_id = address.city_id
GROUP BY city.city

-- Question:
SELECT city.city, SUM(payment.amount) FROM payment
LEFT JOIN rental ON payment.rental_id = rental.rental_id
LEFT JOIN customer ON customer.customer_id = rental.customer_id
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON city.city_id = address.city_id
GROUP BY city.city
ORDER BY SUM(payment.amount) DESC
LIMIT 1

-- Question 8:
SELECT city.city || ', ' || country.country AS city_country, SUM(payment.amount) FROM payment
LEFT JOIN rental ON payment.rental_id = rental.rental_id
LEFT JOIN customer ON customer.customer_id = rental.customer_id
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON city.city_id = address.city_id
LEFT JOIN country ON city.country_id = country.country_id
GROUP BY country.country, city.city
ORDER BY SUM(payment.amount) 
LIMIT 1

