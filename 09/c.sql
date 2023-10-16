CREATE TRIGGER trg_audite_college
AFTER INSERT OR UPDATE OR DELETE 
ON college
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_audite_college();

CREATE OR REPLACE FUNCTION fnc_trg_audite_college()
RETURNS TRIGGER AS
$$
BEGIN
	IF tg_op = 'INSERT' OR tg_op = 'UPDATE' THEN 
	  INSERT INTO college_audit(ds_date, change_type, row_id, "name", "size")
	  VALUES(now(), tg_op, NEW.id, NEW."name", NEW."size");
	  RETURN NEW;
	ELSEIF tg_op = 'DELETE' THEN
	  INSERT INTO college_audit(ds_date, change_type, row_id, "name", "size")
	  VALUES(now(), tg_op, OLD.id, OLD."name", OLD."size");
	  RETURN OLD;
	END IF;
  RETURN null;
END;
$$
LANGUAGE 'plpgsql';
