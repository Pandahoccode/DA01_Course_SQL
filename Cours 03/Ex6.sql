SELECT DISTINCT city from station
WHERE (LAT_N > 0 AND LONG_W > 0) 
AND NOT (CITY LIKE "A%" OR CITY LIKE "I%" OR CITY LIKE "E%" OR CITY LIKE "O%" OR CITY LIKE "U%")