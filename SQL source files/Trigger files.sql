/*
DROP TRIGGER IF EXISTS verifyCPRInsert;

DELIMITER \\
create trigger verifyCPRInsert
BEFORE INSERT
	ON ansat FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(NEW.cpr) < 10 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'CPR nummeret er for kort';
	ELSEIF CHAR_LENGTH(NEW.cpr) > 10 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'CPR nummeret er for langt';
	END IF;
END\\
DELIMITER ;

DROP TRIGGER IF EXISTS verifyINIInsert;
DELIMITER \\
create trigger verifyINIInsert
BEFORE INSERT
	ON ansat FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(NEW.ini) < 2 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'INI er for kort';
	END IF;
END\\
DELIMITER ;

DROP TRIGGER IF EXISTS verifyINIUpdate;
DELIMITER \\
create trigger verifyINIUpdate
BEFORE UPDATE
	ON ansat FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(NEW.ini) < 2 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'INI er for kort';
	END IF;
END\\
DELIMITER ;

DROP TRIGGER IF EXISTS verifyTitelUpdate;
DELIMITER \\
create trigger verifyTitel
BEFORE UPDATE
	ON ansat FOR EACH ROW
BEGIN 
	IF NEW.titel NOT BETWEEN 0 AND 3 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Titel er ugyldig';
    END IF;
END \\
DELIMITER ;


DROP TRIGGER IF EXISTS verifyTitelInsert;
DELIMITER \\
create trigger verifyTitel
BEFORE Insert
	ON ansat FOR EACH ROW
BEGIN 
	IF NEW.titel NOT BETWEEN 0 AND 3 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Titel er ugyldig';
    END IF;
END \\
DELIMITER ;
*/

DROP TRIGGER IF EXISTS verifyAnsatUpdate
DELIMITER \\
create trigger verifyAnsatUpdate
BEFORE UPDATE
	ON ansat FOR EACH ROW
BEGIN
	IF NEW.title NOT BETWEEN 0 AND 3 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Titel er ugyldig';
    ELSEIF CHAR_LENGTH(NEW.ini) < 2 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'INI er for kort';
	END IF;
END \\
DELIMITER ;


DROP TRIGGER IF EXISTS verifyAnsatInsert;
DELIMITER \\
create trigger verifyAnsatInsert
BEFORE Insert
	ON ansat FOR EACH ROW
BEGIN 
	IF NEW.titel NOT BETWEEN 0 AND 3 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Titel er ugyldig';
    ELSEIF CHAR_LENGTH(NEW.cpr) < 10 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'CPR nummeret er for kort';
	ELSEIF CHAR_LENGTH(NEW.cpr) > 10 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'CPR nummeret er for langt';
	ELSEIF NEW.titel NOT BETWEEN 0 AND 3 THEN
		SIGNAL SQLSTATE '50000' SET MESSAGE_TEXT = 'Titel er ugyldig';
    END IF;
END \\
DELIMITER ;

