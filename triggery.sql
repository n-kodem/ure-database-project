-- Trigger dla tabeli 'concession_fuel'
DELIMITER //
CREATE TRIGGER trg_concession_fuel_nip
BEFORE INSERT ON concession_fuel
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM concession_withdrawn WHERE nip = NEW.nip) AND
       NOT EXISTS (SELECT 1 FROM concession_expiry WHERE nip = NEW.nip) AND
       NOT EXISTS (SELECT 1 FROM concession_promise WHERE nip = NEW.nip) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Referential integrity violation: NIP not found in related tables.';
    END IF;
END;
//
DELIMITER ;

-- Trigger dla tabeli 'concession_other_fuel'
DELIMITER //
CREATE TRIGGER trg_concession_other_fuel_nip
BEFORE INSERT ON concession_other_fuel
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM concession_withdrawn WHERE nip = NEW.nip) AND
       NOT EXISTS (SELECT 1 FROM concession_expiry WHERE nip = NEW.nip) AND
       NOT EXISTS (SELECT 1 FROM concession_promise WHERE nip = NEW.nip) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Referential integrity violation: NIP not found in related tables.';
    END IF;
END;
//
DELIMITER ;
-- Trigger dla tabeli 'concession_withdrawn'
DELIMITER //
CREATE TRIGGER trg_concession_withdrawn_delete
BEFORE DELETE ON concession_withdrawn
FOR EACH ROW
BEGIN
    DELETE FROM concession_fuel WHERE nip = OLD.nip;
    DELETE FROM concession_expiry WHERE nip = OLD.nip;
    DELETE FROM concession_promise WHERE nip = OLD.nip;
    DELETE FROM concession_other_fuel WHERE nip = OLD.nip;
END;
//
DELIMITER ;

-- Trigger dla tabeli 'concession_expiry'
DELIMITER //
CREATE TRIGGER trg_concession_expiry_delete
BEFORE DELETE ON concession_expiry
FOR EACH ROW
BEGIN
    DELETE FROM concession_fuel WHERE nip = OLD.nip;
    DELETE FROM concession_withdrawn WHERE nip = OLD.nip;
    DELETE FROM concession_promise WHERE nip = OLD.nip;
    DELETE FROM concession_other_fuel WHERE nip = OLD.nip;
END;
//
DELIMITER ;

-- Trigger dla tabeli 'concession_promise'
DELIMITER //
CREATE TRIGGER trg_concession_promise_delete
BEFORE DELETE ON concession_promise
FOR EACH ROW
BEGIN
    DELETE FROM concession_fuel WHERE nip = OLD.nip;
    DELETE FROM concession_withdrawn WHERE nip = OLD.nip;
    DELETE FROM concession_expiry WHERE nip = OLD.nip;
    DELETE FROM concession_other_fuel WHERE nip = OLD.nip;
END;
//
DELIMITER ;
