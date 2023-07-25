DELIMITER //
CREATE TRIGGER reduce_value_trigger
BEFORE UPDATE ON your_table
FOR EACH ROW
BEGIN
  DECLARE limit_value INT; -- Replace this with your desired limit
  SET limit_value = 100; -- Replace 100 with your desired limit value

  IF NEW.status = 'active' AND NEW.value > limit_value THEN
    SET NEW.value = limit_value;
  END IF;
END;
//
DELIMITER ;
