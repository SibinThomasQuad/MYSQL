DELIMITER //
CREATE TRIGGER prevent_delete_protected
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    IF OLD.is_protected = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete protected row';
    END IF;
END //
DELIMITER ;
