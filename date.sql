SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT name, DAY(birthdate) FROM people;
SELECT name, DAYNAME(birthdate) FROM people;
SELECT name, DAYOFWEEK(birthdate) FROM people; -- give you number
SELECT name, DAYOFYEAR(birthdate) FROM people; -- give you which day is in the year
SELECT name, birthdt,HOUR(birthdt) FROM people;
SELECT DATE_FORMAT(birthdate, "%W-%M-%Y") FROM people;
SELECT birthdt,DATE_FORMAT(birthdt, "%c/%d/%Y at %h:%m") AS 'Formate date' FROM people;
-- DATE arithmetic
SELECT birthdate ,DATEDIFF(NOW(), birthdate) FROM people;-- DateDiff calculate the day difference
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH - INTERVAL 10 HOUR FROM people;
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format

-- TIMESTAMPS
-- CREATE TABLE comments(
--   content VARCHAR(200),
--   created_at TIMESTAMP DEFAULT NOW()
-- );
-- CREATE TABLE comments2(
--   content VARCHAR(200),
--   created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP -- it's mean when the row change then update the timestamp to be current time
-- );
-- update with the early date
-- UPDATE comments2
-- SET content = 'this is not gibberish'
-- WHERE created_at = (
--   SELECT min_created_at
--   FROM (
--     SELECT MIN(created_at) AS min_created_at
--     FROM comments2
--   ) AS t
-- );

-- LOGICAL OPERATOR
SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);