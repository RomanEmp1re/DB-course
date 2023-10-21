CREATE OR REPLACE VIEW v_student_college AS
SELECT
  s.name student_name,
  c.name college_name
FROM student AS s
INNER JOIN college c
ON s.college_id = c.id;

