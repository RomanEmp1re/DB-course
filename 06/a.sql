SELECT
  CASE
    WHEN student_rating < 30 THEN 'неудовлетварительно'
    WHEN student_rating >= 30 AND student_rating < 60 THEN 'удовлетворительно'
    WHEN student_rating >= 60 AND student_rating < 85 THEN 'хорошо'
    ELSE 'отлично'
  END AS "оценка",
  COUNT(*)
FROM
  student_on_course
GROUP BY "оценка"
ORDER BY "оценка";
