DELIMITER //

CREATE FUNCTION ileNumerowAkcyzowych(input_string VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE num_excise_numbers INT DEFAULT 0;
    DECLARE temp_string VARCHAR(255);
    DECLARE delimiter_pos INT;
    DECLARE excise_number VARCHAR(255);

    IF input_string IS NULL OR input_string = '' THEN
        RETURN 0;
    END IF;

    SET temp_string = LOWER(input_string);

    IF INSTR(temp_string, 'nie posiada') > 0 THEN
        RETURN 0;
    END IF;

    SET delimiter_pos = 1;

    WHILE delimiter_pos > 0 DO
        SET delimiter_pos = INSTR(temp_string, ';');
        IF delimiter_pos > 0 THEN
            SET excise_number = SUBSTRING(temp_string, 1, delimiter_pos - 1);
            SET temp_string = SUBSTRING(temp_string, delimiter_pos + 1);
        ELSE
            SET excise_number = temp_string;
        END IF;

        IF excise_number != '' THEN
            SET num_excise_numbers = num_excise_numbers + 1;
        END IF;
    END WHILE;

    RETURN num_excise_numbers;
END //

DELIMITER ;