WITH cte_count AS (
  SELECT 
    COUNT(*) course_count,
    is_online
  FROM course
  GROUP BY is_online
),
cte_online AS (
  SELECT
    cte_count.course_count
  FROM cte_count
  WHERE is_online = TRUE
),
cte_offline AS (
  SELECT 
    cte_count.course_count
  FROM cte_count
  WHERE is_online = FALSE
)
SELECT
  CASE
  WHEN cte_online.course_count > cte_offline.course_count
    THEN 'количество онлайн курсов больше'
  WHEN cte_online.course_count < cte_offline.course_count
    THEN 'количество оффлайн курсов больше'
  ELSE 'онлайн и оффлайн курсов одинаковое количество'
  END
  FROM cte_offline
  CROSS JOIN
  cte_online;

