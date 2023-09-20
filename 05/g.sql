WITH cte_count AS ( 
  SELECT COUNT(*) course_count, is_online
  FROM course
  GROUP BY is_online
  ORDER BY course_count DESC
  LIMIT 1
)
SELECT
  CASE
  WHEN is_online IS TRUE
    THEN 'количество онлайн курсов больше'
  ELSE 'количество оффлайн курсов больше'
  END
  FROM cte_count;
  
