DELIMITER //
CREATE TRIGGER prevent_special_characters_insert
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF NEW.username REGEXP '[^a-zA-Z0-9]' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username contains special characters. Special characters are not allowed.';
    END IF;
    
    IF NEW.name REGEXP '[^a-zA-Z0-9 ]' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Name contains special characters. Special characters are not allowed.';
    END IF;
END;
//

CREATE TRIGGER prevent_special_characters_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.username REGEXP '[^a-zA-Z0-9]' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username contains special characters. Special characters are not allowed.';
    END IF;
    
    IF NEW.name REGEXP '[^a-zA-Z0-9 ]' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Name contains special characters. Special characters are not allowed.';
    END IF;
END;
//
DELIMITER ;
