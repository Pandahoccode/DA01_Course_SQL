-- Ex1
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) FROM CITY 
INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent

-- Ex2
SELECT
ROUND(CAST(SUM(CASE WHEN texts.signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS DECIMAL)/
COUNT(emails.email_id) ,2) AS confirm_rate
FROM emails
LEFT JOIN textsON texts.email_id = emails.email_id 
WHERE texts.signup_action IS NOT NULL

-- Ex3 
SELECT  age_breakdown.age_bucket,

ROUND(SUM(CASE WHEN activities.activity_type = 'send' THEN activities.time_spent ELSE 0 END)/
(SUM(CASE WHEN activities.activity_type = 'send' THEN activities.time_spent ELSE 0 END) +
SUM(CASE WHEN activities.activity_type = 'open' THEN activities.time_spent ELSE 0 END)) * 100.0,2) AS send_perc,

ROUND(SUM(CASE WHEN activities.activity_type = 'open' THEN activities.time_spent ELSE 0 END)/
(SUM(CASE WHEN activities.activity_type = 'send' THEN activities.time_spent ELSE 0 END) +
SUM(CASE WHEN activities.activity_type = 'open' THEN activities.time_spent ELSE 0 END)) * 100.0,2) AS open_perc
FROM activities
INNER JOIN age_breakdown ON activities.user_id = age_breakdown.user_id
GROUP BY age_breakdown.age_bucket 

-- Ex4
SELECT customer_contracts.customer_id FROM customer_contracts
LEFT JOIN products ON customer_contracts.product_id = products.product_id
GROUP BY customer_contracts.customer_id
HAVING COUNT( DISTINCT products.product_category) >= 3
-- Ex5
SELECT Employees.employee_id, Employees.name, 
COUNT(Reporters.employee_id) AS reports_count,
ROUND(AVG(Reporters.age)) AS average_age
FROM Employees 
LEFT JOIN Employees AS Reporters ON Employees.employee_id = Reporters.reports_to
WHERE Reporters.reports_to IS NOT NULL 
GROUP BY Employees.employee_id, Employees.name
ORDER BY Employees.employee_id 

-- Ex6
SELECT Products.product_name, SUM(Orders.unit) AS unit FROM Products
INNER JOIN Orders ON Products.product_id = Orders.product_id
WHERE EXTRACT(month FROM Orders.order_date) = 2 AND EXTRACT(year FROM Orders.order_date) = 2020
GROUP BY Products.product_name
HAVING SUM(Orders.unit) >= 100

-- Ex7
SELECT pages.page_id FROM pages
LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
GROUP BY pages.page_id 
HAVING COUNT(user_id) = 0
ORDER BY pages.page_id 