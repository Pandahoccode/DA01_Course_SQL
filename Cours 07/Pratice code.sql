-- Ex1  
SELECT Name
FROM STUDENTS 
WHERE Marks > 75
ORDER BY RIGHT(Name, 3) ASC, ID ASC

-- Ex2
SELECT user_id
UPPER(LEFT(name,1)) || LOWER(SUBSTRING(name FROM 1 FOR LENGTH(name))) AS name
FROM Users
ORDER BY user_id;

-- Ex3
SELECT manufacturer,
'$'||ROUND(SUM(total_sales)/1000000,0) || ' million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer ASC

-- Ex4
SELECT EXTRACT(month FROM submit_date) AS mth,
product_id AS product,
ROUND(AVG(stars),2) AS avg_stars 
FROM reviews
GROUP BY EXTRACT(month FROM submit_date), product_id
ORDER BY EXTRACT(month FROM submit_date), product_id;

-- Ex5
SELECT sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(month FROM sent_date) = '08' AND EXTRACT(year FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;

-- Ex6
SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15 

-- Ex7
SELECT activity_date AS day,
COUNT(DISTINCT user_id ) AS active_users 
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27' 
GROUP BY activity_date

-- Ex8
SELECT EXTRACT(month FROM joining_date) AS month, COUNT(id)
FROM employees
WHERE EXTRACT(month FROM joining_date) BETWEEN 1 AND 7
GROUP BY EXTRACT(month FROM joining_date)

-- Ex9
SELECT POSITION('a' IN first_name)
FROM worker
WHERE first_name = 'Amitah'

-- Ex10
SELECT winery, CAST(SUBSTRING(title FROM LENGTH(winery) + 1 FOR 5) AS INT)
FROM winemag_p2
WHERE country = 'Macedonia'