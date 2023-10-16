CREATE TRIGGER trg_check_contact
BEFORE UPDATE OR INSERT
ON student
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_check_contact();

CREATE OR REPLACE FUNCTION fnc_trg_check_contact()
RETURNS TRIGGER AS 
$$
BEGIN
	IF NEW.telegram_contact IS NULL 
	THEN NEW.telegram_contact := '@default_contact';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';
