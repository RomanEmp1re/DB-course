SELECT DISTINCT
	s1.name,
	s2.name,
	s1.city
FROM student AS s1
JOIN student AS s2
ON s1.city = s2.city AND s1.id <> s2.id
AND s1.name < s2.name;
