CREATE OR REPLACE VIEW v_student_course_rating AS
SELECT
  s.name student_name,
  c.name course_name,
  cg.name student_college,
  sc.student_rating
FROM student_on_course sc
INNER JOIN course c
ON c.id = sc.course_id
INNER JOIN student s
ON s.id = sc.student_id
INNER JOIN college cg
ON cg.id = s.college_id
ORDER BY student_name ASC, course_name ASC;

