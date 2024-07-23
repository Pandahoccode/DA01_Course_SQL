-- INNER JOIN 
-- Syntax: 
SELECT t1.*, t2*
FROM table1 AS t1
INNER JOIN table2 AS t2
ON t1.key1 = t2.key2;

SELECT A.payment_id, A.customer_id, B.first_name, B.last_name
FROM payment AS A
INNER JOIN customer AS B
ON A.customer_id = B.customer_id;

SELECT * FROM bookings.seats;
SELECT * FROM bookings.boarding_passes;

-- INNER JOIN CHALLENGE
SELECT DISTINCT seats.fare_conditions,
COUNT(*)
FROM seats
INNER JOIN boarding_passes
ON boarding_passes.seat_no = seats.seat_no
GROUP BY DISTINCT seats.fare_conditions

-- LEFT/RIGHT JOIN
/* Detect table 
	1st: Select table 
	2nd: Select keyjoin
	3nd: Select JOIN method
*/

-- LEFT/RIGHT JOIN CHALLENGE	
SELECT * FROM bookings.seats;
SELECT * FROM bookings.boarding_passes;

SELECT DISTINCT seats.seat_no, COUNT(boarding_passes.seat_no)
FROM seats
LEFT JOIN boarding_passes
ON boarding_passes.seat_no = seats.seat_no
GROUP BY seats.seat_no
ORDER BY COUNT(boarding_passes.seat_no);

SELECT seats.seat_no, boarding_passes.seat_no
FROM seats
LEFT JOIN boarding_passes
ON boarding_passes.seat_no = seats.seat_no
WHERE boarding_passes.seat_no = 'n/a' OR boarding_passes.seat_no IS NULL
ORDER BY seats.seat_no;

SELECT DISTINCT RIGHT(seats.seat_no, 1), COUNT(boarding_passes.seat_no)
FROM seats
LEFT JOIN boarding_passes
ON boarding_passes.seat_no = seats.seat_no
GROUP BY RIGHT(seats.seat_no, 1)
ORDER BY COUNT(boarding_passes.seat_no) DESC;

-- FULL JOIN 

-- JOIN ON  MULTIPLE CONDITIONS 
-- Case when we have 2 keys need to JOIN 
SELECT boarding_passes.seat_no, ticket_flights.amount
FROM bookings.boarding_passes 
LEFT JOIN bookings.ticket_flights 
ON ticket_flights.ticket_no = ticket_flights.ticket_no
AND ticket_flights.flight_id = ticket_flights.flight_id;

-- JOIN MULTIPLE TABLES
-- Syntax:
SELECT t1.*, t2*
FROM table1 AS t1
INNER JOIN table2 AS t2
INNER JOIN table3 AS t3
ON t1.key1 = t2.key2;

-- JOIN MULTIPLE TABLES CHALLENGE
-- adress -> city -> country
SELECT customer.customer_id, customer.first_name, customer.last_name, customer.email,
address.address_id, city.city_id, country.country_id, country.country
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Brazil'

-- SELF JOIN 
SELECT t1.*, t2*
FROM table1 AS t1
LEFT JOIN table2 AS t2 ON t1.key1 = t2.key2; -- In this case t1 is t2 but we just using another name for t2

