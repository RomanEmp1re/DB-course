CREATE TABLE student_on_course_kn 
AS
    SELECT
      student_on_course.id,
      student_on_course.student_id,
      student_on_course.course_id,
      student_on_course.student_rating,
      student_on_course.finished_date,
      student.name,
      student.city
    FROM student_on_course
    INNER JOIN student
    ON student_on_course.student_id = student.id
  WHERE city IN ('Казань', 'Новосибирск');
