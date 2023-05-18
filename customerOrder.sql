USE customers_and_orders;
-- CREATE TABLE customers(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   first_name VARCHAR(200),
--   last_name VARCHAR(200),
--   email VARCHAR(100)
-- );
-- CREATE TABLE orders(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   date DATE,
--   amount DECIMAL(8,2),
--   customer_id INT,
--   FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE -- when delete customer the order will be delete as well
-- );

-- DESC orders;
-- drop foreign key constranit
-- SHOW CREATE TABLE orders; -- this will show the detail of table creation
-- ALTER TABLE orders
-- DROP FOREIGN KEY orders_ibfk_1;

-- create foreign key constranit
-- ALTER TABLE orders 
-- ADD CONSTRAINT FOREIGN KEY (customer_id)
-- REFERENCES customers (id)
-- INSERT INTO orders (date, amount, customer_id)
-- VALUES ('2016/12/11', 91.99, 32);
SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

-- implicit inner join
SELECT first_name, last_name, date, amount FROM orders,customers WHERE customers.id = orders.customer_id ;

-- explicit inner join
SELECT first_name, last_name, GROUP_CONCAT(date SEPARATOR ', ') AS date, SUM(amount) AS total_spent FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id ORDER BY total_spent;

-- left join(when there is NULL mean nothing to join in this table)
SELECT first_name, last_name, CASE WHEN SUM(amount) IS NULL THEN 0 ELSE SUM(amount) END AS amount FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent  FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id; -- a better way to use IFNULL


-- right join
SELECT first_name, last_name, SUM(amount)  AS total_spent  FROM customers RIGHT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;