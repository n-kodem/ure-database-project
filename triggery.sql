CREATE TRIGGER UpdateConcession
AFTER UPDATE ON concession_withdrawn
FOR EACH ROW
BEGIN
    -- Aktualizacja danych w innych tabelach na podstawie zmian w tabeli concession_withdrawn
    UPDATE concession_expiry SET podstawaprawna = NEW.podstawaprawna WHERE nip = NEW.nip;
    UPDATE concession_promise SET podstawaprawna = NEW.podstawaprawna WHERE nip = NEW.nip;
END;

CREATE TRIGGER DeleteConcession
AFTER DELETE ON concession_withdrawn
FOR EACH ROW
BEGIN
    -- Usunięcie danych z innych tabel na podstawie usunięcia z tabeli concession_withdrawn
    DELETE FROM concession_expiry WHERE nip = OLD.nip;
    DELETE FROM concession_promise WHERE nip = OLD.nip;
END;

CREATE TRIGGER UpdateConcessionValidity
BEFORE INSERT ON concession_expiry
FOR EACH ROW
BEGIN
    -- Obliczanie nowej daty ważności koncesji na podstawie daty wygaśnięcia
    SET NEW.datawygasniecia = DATE_ADD(NEW.datawygasniecia, INTERVAL 1 YEAR);
END;
-- Jego celem jest automatyczne aktualizowanie daty ważności koncesji na podstawie daty wygaśnięcia. W tym przypadku, założyliśmy, że koncesje mają ważność przez rok, więc nowa data ważności jest obliczana poprzez dodanie roku do daty wygaśnięcia.

CREATE TRIGGER SyncConcessionData
AFTER INSERT ON concession_withdrawn
FOR EACH ROW
BEGIN
    -- Synchronizacja danych koncesji między różnymi tabelami
    INSERT INTO concession_expiry (dkn, nazwa, adres, kod_pocztowy, miejscowosc, wojewodztwo, nip, regon, rodzajkoncesji, datawygasniecia, sposobrozstrzygniecia, podstawaprawna, uwagi)
    VALUES (NEW.dkn, NEW.nazwa, NEW.adres, NEW.kod_pocztowy, NEW.miejscowosc, NEW.wojewodztwo, NEW.nip, NEW.regon, NEW.rodzajkoncesji, NEW.datacofniecia, 'Wycofanie', NEW.podstawaprawna, NEW.uwagi);
END;
-- Po wycofaniu koncesji, dane dotyczące tego wycofania są również dodawane do tabeli concession_expiry, aby zachować spójność danych.