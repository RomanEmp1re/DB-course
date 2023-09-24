SELECT
  course.name "курс",
  CASE
    WHEN student_rating < 30 THEN 'неудовлетварительно'
    WHEN student_rating >= 30 AND student_rating < 60 THEN 'удовлетворительно'
    WHEN student_rating >= 60 AND student_rating < 85 THEN 'хорошо'
    ELSE 'отлично'
  END AS "оценка",
  COUNT(*) "количество студентов"
FROM
  student_on_course
  LEFT JOIN course
  ON student_on_course.course_id = course.id
GROUP BY "курс", "оценка"
ORDER BY "курс", "оценка";
