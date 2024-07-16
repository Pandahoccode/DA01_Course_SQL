-- CASE - WHEN 
-- Syntax : 
CASE 
	WHEN ..... THEN
END;

SELECT 
CASE 
	WHEN length < 60 THEN 'short'
	WHEN length BETWEEN 60 AND 120 THEN 'medium'
	WHEN length > 120 THEN 'long' 
	-- If case don't exist then auto null
	-- You can use ELSE instead
END category,
COUNT(*) AS Number
FROM film
GROUP BY category;

SELECT 
CASE 
	WHEN rating IN ('PG','G') THEN 1 
	WHEN rating NOT IN ('PG','G') THEN 0 -- OR ELSE 0
END TAG
FROM film

-- CASE - WHEN CHALLENGE
-- Challenge 1:
SELECT 
CASE 
	WHEN amount < 20000 THEN 'Low price ticket'
	WHEN amount BETWEEN 20000 AND 150000 THEN 'Mid price ticket'
	ELSE 'High price ticket'
END Ticket_type,
COUNT (*) AS number
FROM bookings.ticket_flights
GROUP BY Ticket_type;

-- Challenge 2:
SELECT 
CASE 
	WHEN EXTRACT(month FROM actual_departure) IN (2,3,4) THEN 'Spring'
	WHEN EXTRACT(month FROM actual_departure) IN (5,6,7) THEN 'Summer'
	WHEN EXTRACT(month FROM actual_departure) IN (8,9,10) THEN 'Autumn'
	ELSE 'Winter'
END season,
COUNT(*) AS Number
FROM bookings.flights
GROUP BY season;

-- Challenge 3:
SELECT film_id, title,
CASE 
	WHEN rating IN ('PG','PG-13') OR length > 120 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Schity drama (tier 3)'
	WHEN rental_rate < 1 THEN 'Very cheap (Tier 4)'
END ranked_film
FROM film
WHERE CASE 
	WHEN rating IN ('PG','PG-13') OR length > 120 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' AND length > 90 THEN 'Schity drama (tier 3)'
	WHEN rental_rate < 1 THEN 'Very cheap (Tier 4)'
	END
IS NOT NULL;

-- PIVOT BY CASE - WHEN
-- Replace below
SELECT customer_id,
CASE 
	WHEN amount > 10 THEN 'high'
	WHEN amount BETWEEN 5 AND 10 THEN 'medium' 
	ELSE 'low'
END amount,
SUM(amount)
FROM payment
GROUP BY customer_id, amount

-- Instead Using
SELECT customer_id,
SUM(CASE 
	WHEN amount > 10 THEN amount
	ELSE 0 
END ) AS high,
SUM(CASE 
	WHEN amount BETWEEN 5 AND 10 THEN amount
	ELSE 0 
END ) AS medium,
SUM (CASE 
	WHEN amount < 5 THEN amount
	ELSE 0 
END ) AS low
FROM payment
GROUP BY customer_id
ORDER BY customer_id

-- PIVOT BY CASE - WHEN CHALLENGE
SELECT 
CASE 
	WHEN length < 60 THEN 'short'
	WHEN length BETWEEN 60 AND 120 THEN 'medium'
	WHEN length > 120 THEN 'long' 
END category,
SUM (
CASE 
	WHEN rating = 'R' THEN 1
	ELSE 0
END ) AS R,
SUM (
CASE 
	WHEN rating = 'PG' THEN 1
	ELSE 0
END) AS PG,
SUM (
CASE 
	WHEN rating = 'PG-13' THEN 1
	ELSE 0
END) AS PG_13
FROM film
GROUP BY category;

-- COALESCE
-- Remove AND Update every NULL variables in column 
SELECT 
scheduled_arrival,
actual_arrival,
COALESCE(actual_arrival, '2020-01-01') AS fixed, 
COALESCE(actual_arrival, scheduled_arrival) AS updated,
COALESCE(actual_arrival - scheduled_arrival, '00:00')
FROM bookings.flights

-- CAST 
-- Syntax:
CAST(column AS data_type)
-- USING
string -> number : string must be full numeric
number -> string
datetime -> string 
.....
	
SELECT scheduled_arrival,
actual_arrival,
COALESCE(actual_arrival, scheduled_arrival) AS updated,
COALESCE(CAST(actual_arrival - scheduled_arrival AS varchar), 'Not arrived')
FROM bookings.flights

