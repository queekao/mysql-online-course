-- CREATE DATABASE trigger_demo;
USE trigger_demo;
-- this line is using to 'start' DELIMITER
/* sqlformatter:off */
--  NEW keyword mean new user
-- 45000 is a wildcard status "unhandled user-defined exception"
-- DELIMITER allow to insert '$$' as the start and the end 
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$
-- this line is use to change DELIMITER back to ';'
DELIMITER ;
/* sqlformatter:on */