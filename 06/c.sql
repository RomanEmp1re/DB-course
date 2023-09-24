WITH cte AS (
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
  UNION
  SELECT
    course.name "курс",
    NULL AS "оценка",
    COUNT(*)
  FROM
    student_on_course
    LEFT JOIN course
    ON student_on_course.course_id = course.id
  GROUP BY "курс"
  UNION
  SELECT 
    NULL "курс",
    CASE
      WHEN student_rating < 30 THEN 'неудовлетварительно'
      WHEN student_rating >= 30 AND student_rating < 60 THEN 'удовлетворительно'
      WHEN student_rating >= 60 AND student_rating < 85 THEN 'хорошо'
      ELSE 'отлично'
    END AS "оценка",
    COUNT(*)
  FROM
    student_on_course
    LEFT JOIN course
    ON student_on_course.course_id = course.id
  GROUP BY "оценка"
  UNION
  SELECT 
    NULL "курс",
    NULL "оценка",
    COUNT (*)
  FROM student_on_course
  ORDER BY "курс", "оценка"
)
SELECT
  row_number () OVER (ORDER BY "курс") "№ сроки",
  row_number () OVER (PARTITION BY "курс" ORDER BY "оценка") "№ строки в группе",
  *
FROM cte;
