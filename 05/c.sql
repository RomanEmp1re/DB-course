WITH student_studies_in AS (
  SELECT
    student.id AS id,
    student.name AS student_name,
    college.id AS college_id
  FROM student
  LEFT JOIN college
  ON college.id = student.college_id
),
students_course_in AS (
  SELECT
    student.name AS student_name,
    course.college_id AS course_college_id,
    course.name AS course_name
  FROM student_on_course
  LEFT JOIN student
  ON student_on_course.student_id = student.id
  LEFT JOIN course
  ON student_on_course.course_id = course.id
)
SELECT 
  students_course_in.student_name,
  students_course_in.course_name
FROM
  students_course_in
LEFT JOIN student_studies_in
ON students_course_in.student_name = student_studies_in.student_name
WHERE students_course_in.course_college_id = student_studies_in.college_id;
