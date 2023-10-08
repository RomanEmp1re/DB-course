CREATE OR REPLACE FUNCTION getStudentHierarchy(p_manager_id INT DEFAULT NULL)
	RETURNS TABLE (
		"студент" VARCHAR(20),
		"роль" VARCHAR(100),
		"уровень" INT,
		"путь от лидера" TEXT) AS 
$$
BEGIN
IF p_manager_id IS NULL THEN p_manager_id := 0;
END IF;

RETURN QUERY
	WITH RECURSIVE _hierarchy AS(
		SELECT
			id,
			student_name,
			1 AS "level",
			ARRAY[student_name]::varchar[] AS "path",
			'0' AS managers_id
		FROM startup_tree
		WHERE manager_id IS NULL
		UNION
		SELECT 
			s.id,
			s.student_name,
			"level" + 1 AS "level",
			"path" || s.student_name AS "path",
			CONCAT(managers_id, s.manager_id) AS managers_id
		FROM startup_tree AS s
		INNER JOIN _hierarchy
		ON s.manager_id = _hierarchy.id
	)
	SELECT
		_hierarchy.student_name,
		roles."role",
		_hierarchy."level",
		ARRAY_TO_STRING("path", '->') AS "path"
	FROM _hierarchy
	INNER JOIN roles
	ON _hierarchy.id = roles.student_id
	WHERE _hierarchy.managers_id LIKE '%' || p_manager_id::char || '%';
	END;
$$
LANGUAGE 'plpgsql';

select * from getStudentHierarchy(3);

