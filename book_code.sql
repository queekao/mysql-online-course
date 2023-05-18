USE book_shop;
SELECT CONCAT(SUBSTR(title,1,10),'...') AS 'short title' FROM books;
SELECT SUBSTRING(REPLACE(title, 'e', 3),1,10) AS 'Weird String' from books;
SELECT REVERSE(title) FROM books;
SELECT CHAR_LENGTH('Alisa Chen') AS 'Girlfriend length';
SELECT CONCAT(author_lname,' is ', CHAR_LENGTH(author_lname),' characters long ') AS 'author last name' FROM books;
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT REPLACE(title, ' ', '->') AS 'title' FROM books;
SELECT author_lname AS 'forwards', REVERSE(author_lname) AS 'backwards' FROM books;
SELECT CONCAT(title,' was released in ' ,released_year) AS 'blurb'  from books;
SELECT title, CHAR_LENGTH(title) AS 'character count' from books;
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title', CONCAT(author_lname, ','  ,author_fname) AS 'author' ,CONCAT(stock_quantity, ' in stock') AS 'quantity' FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) AS 'full name' FROM books;
SELECT released_year,title, author_fname, author_lname  FROM books ORDER BY 1 DESC;
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname; -- sort by the lastname and then sort by firstname;
SELECT title, released_year FROM books  ORDER BY released_year  LIMIT 2,5; -- the first one number of limit is the starting point
SELECT * FROM books WHERE author_fname LIKE '%da%'; -- '%' a wildcard this mean find the author first name contain da
SELECT * FROM books WHERE stock_quantity LIKE '___'; -- search quantity have 4 character long
SELECT * FROM books WHERE title LIKE '%\_%'; -- search the '\' is a scape charater just like you regluar use
SELECT title FROM books WHERE title LIKE "%stories%";
-- logical operator
SELECT * FROM books WHERE CONCAT(author_fname,' ', author_lname)='Dave Eggers' AND released_year >= 2010 && released_year <= 2012;
SELECT * FROM books WHERE CONCAT(author_fname,' ', author_lname)='Dave Eggers' OR released_year >= 2010 || stock_quantity > 200;
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT IN (2017);
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year, CASE WHEN released_year >= 2000 THEN 'Modern Lit' ELSE '20th Century Lit' END AS GENRE FROM books;
SELECT title, stock_quantity, CASE WHEN stock_quantity <= 50 THEN '*' WHEN stock_quantity BETWEEN 50 AND 100 THEN '**' WHEN stock_quantity >= 100 THEN '***' END AS STOCK FROM books;
