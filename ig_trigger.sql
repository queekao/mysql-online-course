-- DELIMITER $$

-- CREATE TRIGGER trigger_name
--      trigger_time trigger_event ON table_name FOR EACH ROW
--      BEGIN
--      END;
-- $$

-- DELIMITER ;
-- can't follow yourself example
-- DELIMITER $$

-- CREATE TRIGGER prevent_follow_self
--      BEFORE INSERT ON follows FOR EACH ROW
--      BEGIN
--        IF NEW.followee_id = NEW.follower_id
--        THEN 
--           SIGNAL SQLSTATE '45000'
--           SET MESSAGE_TEXT = 'You cannot follow youself!';
--        END IF;
--      END;
-- $$

-- DELIMITER ;
-- if someone 'unfollow' insert one new row in 
-- OLD keyword for old value
DELIMITER $$

CREATE TRIGGER capture_unfollow
     AFTER DELETE ON follows FOR EACH ROW
     BEGIN
       INSERT INTO unfollows
       SET 
       follower_id = OLD.follower_id,
       followee_id = OLD.followee_id;
     END;
$$

DELIMITER ;