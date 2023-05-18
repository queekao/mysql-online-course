SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM  books;
SELECT COUNT(title) FROM books WHERE title  LIKE '%the%';
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_fname, author_lname; -- GROUP BY aggregate the same user together we can use count to get them out
SELECT title,pages FROM books WHERE pages = (SELECT Min(pages) FROM books); -- a little bit slow ( running 2 query O(qudratic time))
-- sql_mode=only_full_group_by default sql mode
-- find the author publish their first book > to do that we need GROUP BY the author
SELECT author_fname, author_lname, MIN(released_year) AS 'early year', COUNT(*) 'total_book' FROM books GROUP BY author_fname, author_lname;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'author', MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_fname, author_lname;
SELECT author_fname, author_lname, SUM(released_year) FROM books GROUP BY author_fname, author_lname;
SELECT released_year, AVG(stock_quantity),COUNT(stock_quantity) FROM books GROUP BY released_year ORDER BY released_year;

-- myself play ground
SELECT CONCAT(author_fname,' ' ,author_lname) AS author, title , COUNT(*)  FROM books GROUP BY author_fname, author_lname, title ORDER BY MAX(CHAR_LENGTH(title)) DESC LIMIT 1;

-- Challenge
SELECT COUNT(*) FROM books;
SELECT released_year, COUNT(*) AS 'book total' FROM books GROUP BY released_year ORDER BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT CONCAT(author_fname,' ' ,author_lname) AS author, AVG(released_year) FROM books GROUP BY author_fname, author_lname;
SELECT CONCAT(author_fname,' ' ,author_lname) AS author, MAX(pages)  FROM books GROUP BY author_fname, author_lname ORDER BY MAX(pages) DESC LIMIT 1;
SELECT pages, CONCAT(author_fname, ' ', author_lname) FROM books ORDER BY pages DESC LIMIT 1; -- alternative way to get the max page
SELECT released_year AS year, COUNT(*) AS '# books' ,AVG(pages) AS 'avg pages'  FROM books GROUP BY released_year ORDER BY released_year;