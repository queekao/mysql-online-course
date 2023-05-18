SELECT 10 != 10;
SELECT 15 > 14 && 99 -5 <=94;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;-- when use IN remember to add () operator
SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname = 'eggers' OR author_lname = 'Chabon';
SELECT * FROM books WHERE author_lname IN('eggers','Chabon');
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';
SELECT * FROM books WHERE SUBSTR(author_lname,1,1) IN ('s','c');
SELECT author_lname, CASE WHEN title LIKE '%stories%' THEN 'Short Stories' WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking work%' THEN 'Memoir' ELSE 'Novel' END AS TYPE FROM books GROUP BY author_lname, TYPE;
SELECT GROUP_CONCAT(title SEPARATOR ', ') AS title, author_lname,CASE WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*),' ','books') ELSE '1 book' END AS COUNT FROM books GROUP BY author_lname, author_fname;
