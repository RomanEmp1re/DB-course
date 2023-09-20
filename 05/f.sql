WITH cte_1 AS (
  SELECT 
    student.name student_name,
    student_on_course.course_id
  FROM student_on_course
  LEFT JOIN student
  ON student_on_course.student_id = student.id
)
SELECT
  CASE
    WHEN cte_1.student_name IS NULL
    THEN 'курс не используется'
    ELSE cte_1.student_name
    END,
  course.name
FROM course
LEFT JOIN cte_1
ON cte_1.course_id = course.id
WHERE NOT course.is_online
