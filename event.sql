DELIMITER //

CREATE EVENT backup_tygodniowy 
ON SCHEDULE EVERY 1 WEEK 
STARTS CURRENT_TIMESTAMP 
DO 
BEGIN 
    CALL `ExportTableToCSV`('concession_application');
    CALL `ExportTableToCSV`('concession_expiry');
    CALL `ExportTableToCSV`('concession_fuel');
    CALL `ExportTableToCSV`('concession_other_fuel');
    CALL `ExportTableToCSV`('concession_promise');
    CALL `ExportTableToCSV`('concession_refused');
    CALL `ExportTableToCSV`('concession_remitted');
    CALL `ExportTableToCSV`('concession_withdrawn');
    CALL `ExportTableToCSV`('concession_without_recognition');
END//

DELIMITER ;