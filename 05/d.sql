SELECT 
  MIN(student_rating) min_student_rating,
  MAX(student_rating) max_student_rating,
  ROUND(AVG(student_rating), 2) avg_student_rating,
  SUM(student_rating) sum_student_rating
FROM student_on_course;
