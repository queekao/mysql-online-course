USE new_testing_db;
-- CREATE TABLE inventory (
--     item_name VARCHAR(200),
--     price DECIMAL(8,2),
--     quantity INT
-- );
-- 2.what difference between timestamps and datetime? basically the timestamps end up less memory usage than datetime
-- and the support range of the daytime is different timestamp is limited
SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW()); -- day of week return num
SELECT DAYOFWEEK(CURDATE());
SELECT DAYNAME(NOW()); -- day of week return name
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
-- CREATE TABLE tweets(
--   content VARCHAR(140),
--   username VARCHAR(20),
--   created_at TIMESTAMP DEFAULT NOW()
-- );