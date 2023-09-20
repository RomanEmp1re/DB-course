WITH cte_r AS (
	SELECT student.name AS student_name,
		student_on_course.student_rating AS student_rating,
		student_on_course.course_id AS course_name
	FROM student_on_course
	LEFT JOIN student
	ON student_on_course.student_id = student.id
	LEFT JOIN course
	ON student_on_course.course_id = course.id
	WHERE student_rating > 50
),
cte_c AS (
	SELECT student.name AS student_name,
		college.name AS student_college,
		college.size AS college_size
	FROM student
	LEFT JOIN college
	ON student.college_id = college.id)
SELECT cte_r.student_name,
	cte_r.course_name,
	cte_c.student_college,
	cte_r.student_rating
FROM cte_r
LEFT JOIN cte_c
ON cte_r.student_name = cte_c.student_name
WHERE cte_c.college_size > 5000
ORDER BY cte_r.student_name,
	cte_r.course_name;
