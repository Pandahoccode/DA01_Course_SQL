/* Cách phân tích yêu cầu 
1. Output (gốc/ phái sinh)
2. Input
3. Điều kiện lọc theo trường nào ? (gốc/ phái sinh) */

-- Ex1
SELECT DISTINCT city FROM station 
WHERE id % 2 = 0
AND ( LAT_N > 0 AND LONG_W > 0);

-- Ex2
SELECT city,
COUNT(city) - COUNT(DISTINCT city)
FROM station
GROUP BY (city)
ORDER BY (city);

-- Ex4
SELECT 
ROUND(CAST(SUM(item_count * order_occurrences) / SUM(order_occurrences) AS numeric), 1) AS MEAN
FROM items_per_order;

-- Ex5  
SELECT candidate_id
FROM candidates
WHERE skill IN ("Python", "Tableau", "PostgreSQL")
GROUP BY candidate_id
HAVING COUNT(skill) = 3;

-- Ex6
/* Cách phân tích yêu cầu 
1. Output (gốc/ phái sinh) user_id, days between = max(day) - min(day)
2. Input
3. Điều kiện lọc theo trường nào ? (gốc/ phái sinh) */
SELECT user_id,
DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM posts
WHERE post_date BETWEEN ('01/01/2021') AND ('01/01/2022')
GROUP BY user_id
HAVING COUNT (post_id) > 1;

-- Ex7
/* Cách phân tích yêu cầu 
1. Output (gốc/ phái sinh) card_name, Max(amount) - min(amount)
2. Input
3. Điều kiện lọc theo trường nào ? (gốc/ phái sinh) */
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY MAX(issued_amount) - MIN(issued_amount) DESC;

-- Ex8 
/* Cách phân tích yêu cầu -- COGS: Cost of goods sold
1. Output (gốc/ phái sinh) manufacturer, cogs, COUNT
2. Input
3. Điều kiện lọc theo trường nào ? (gốc/ phái sinh) */
SELECT manufacturer,
COUNT(drug) AS drug_count,
SUM(ABS(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY SUM(ABS(cogs - total_sales)) DESC;

-- Ex9
/* Cách phân tích yêu cầu 
1. Output (gốc/ phái sinh) id % 2 = 0, description not "boring"
2. Input
3. Điều kiện lọc theo trường nào ? (gốc/ phái sinh) */
SELECT * FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;

-- Ex10 
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher 
GROUP BY teacher_id;

-- Ex11
SELECT user_id,
COUNT(DISTINCT follower_id) AS  followers_count
FROM Followers 
GROUP BY user_id
ORDER BY user_id;

-- Ex12
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5
