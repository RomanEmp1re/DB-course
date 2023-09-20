SELECT city
FROM student
GROUP BY city
HAVING count(*) >= 2
ORDER BY city;
