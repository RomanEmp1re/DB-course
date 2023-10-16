CREATE OR REPLACE FUNCTION fn_trg_check_permissions()
RETURNS TRIGGER AS 
$$
BEGIN
  IF EXTRACT(DOW FROM NOW()) NOT BETWEEN 1 AND 5
	  OR
	  EXTRACT(HOUR FROM NOW()) NOT BETWEEN 9 AND 18
  THEN RAISE EXCEPTION 'Вы не можете выполнить изменение
    базы данных в нерабочее время';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_check_permissions
BEFORE UPDATE OR DELETE OR INSERT
ON course
FOR EACH STATEMENT
EXECUTE PROCEDURE fn_trg_check_permissions();
