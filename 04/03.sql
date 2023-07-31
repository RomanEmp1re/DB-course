DELETE from student_on_course_kn
WHERE course_id IN (
  SELECT id
  FROM course
  WHERE name = 'Цифровая трансформация'
)
AND
city = 'Новосибирск';
