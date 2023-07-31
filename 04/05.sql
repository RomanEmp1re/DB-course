SELECT
student_info.student_name,
student_rating,
student_info.student_college_name,
course_info.course_name,
course_info.course_college_name
FROM student_on_course_kn
join
(
  SELECT
  student.id,
  student.name as student_name,
  college.name as student_college_name
  FROM student
  JOIN college
  ON college.id = student.college_id
) as student_info
ON student_on_course_kn.student_id = student_info.id
JOIN
(
  select 
  course.id,
  college.name as course_college_name,
  course.name as course_name
  from course
  join college
  on course.college_id = college.id
) as course_info
ON student_on_course_kn.course_id = course_info.id
ORDER BY student_name, course_name;

