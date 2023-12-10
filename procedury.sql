DROP PROCEDURE IF EXISTS WygasnieteKoncesjeNaTenMiesiac;
DELIMITER //
CREATE PROCEDURE WygasnieteKoncesjeNaTenMiesiac() BEGIN
	SELECT concession_expiry.*
    FROM concession_expiry
    WHERE YEAR(datawygasniecia) = YEAR(current_timestamp())
    AND MONTH(datawygasniecia) = MONTH(current_timestamp());
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS KoncesjeWygasnieteWxOstatnichLatach;
DELIMITER //
CREATE PROCEDURE KoncesjeWygasnieteWxOstatnichLatach(IN x INT) BEGIN
	SELECT concession_expiry.*
    FROM concession_expiry
    WHERE YEAR(current_timestamp()) - x <= datawygasniecia;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS IloscKoncesjiPaliwowychWydaneNaWojewodztwo;
DELIMITER //
CREATE PROCEDURE IloscKoncesjiPaliwowychWydaneNaWojewodztwo() BEGIN
	SELECT wojewodztwo, COUNT(*) ilosc
    FROM concession_fuel
    GROUP BY wojewodztwo;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS IloscInnychKoncesjiWydanychNaWojewodztwo;
DELIMITER //
CREATE PROCEDURE IloscInnychKoncesjiWydanychNaWojewodztwo() BEGIN
	SELECT concession_other_fuel.wojewodztwo, COUNT(*) ilosc
    FROM concession_other_fuel
    GROUP BY wojewodztwo;
END //
DELIMITER ;
