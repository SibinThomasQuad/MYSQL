DELIMITER //
CREATE TRIGGER duplicate_row
AFTER INSERT ON source_table
FOR EACH ROW
BEGIN
    INSERT INTO target_table (column1, column2)
    VALUES (NEW.column1, NEW.column2);
END //
DELIMITER ;
