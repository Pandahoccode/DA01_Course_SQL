-- Ex1
SELECT 
SUM(
CASE WHEN device_type = 'tablet' THEN 1
    ELSE 0 
    END) AS tablet_views,
SUM(
CASE WHEN device_type = 'laptop' THEN 1
    ELSE 0 
    END) AS laptop_views,
SUM(
CASE WHEN device_type = 'mobile' THEN 1
    ELSE 0 
    END) AS mobile_views
FROM viewership 

-- Ex2
SELECT x,y,z,
CASE 
    WHEN x + y - z > 0 
    AND x + z - y > 0 
    AND y + z - x > 0 THEN 'Yes'
    ELSE 'No'
END triangle
FROM Triangle

-- Ex3
SELECT 
ROUND(CAST(100 * SUM (CASE WHEN call_category ='n/a' OR call_category IS NULL THEN 1 END ) AS decimal)/ -- Divide
CAST(COUNT (DISTINCT case_id) AS decimal),1)
FROM callers

-- Ex4 
SELECT name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL

-- Ex5
SELECT survived,
SUM (CASE WHEN pclass = 1 THEN 1 END) AS fisrt_class,
SUM (CASE WHEN pclass = 2 THEN 1 END) AS second_class,
SUM (CASE WHEN pclass = 3 THEN 1 END) AS third_class
FROM titanic
GROUP BY survived