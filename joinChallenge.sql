-- this challenge work in the school db
USE school;
-- CREATE TABLE students(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   first_name VARCHAR(20)
-- );
-- CREATE TABLE papers(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   title VARCHAR(200),
--   grade INT,
--   student_id INT,
--   FOREIGN KEY(student_id) REFERENCE students(id) ON DELETE CASCADE
-- );
-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);
SELECT first_name, title, grade FROM students INNER JOIN papers ON students.id = papers.student_id ORDER BY grade DESC;
SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;
SELECT first_name, IFNULL(title,'MISSING'), IFNULL(grade, 0) FROM students LEFT JOIN papers ON students.id = papers.student_id;
SELECT first_name, IFNULL(AVG(grade), 0) AS average  FROM students LEFT JOIN papers ON students.id = papers.student_id GROUP BY first_name ORDER BY average DESC;
-- SELECT first_name, average,
--       CASE WHEN average >= 75 THEN 'PASSING' ELSE 'FAILING' END AS passing_status
--      FROM (
--       SELECT students.first_name, SUM(IFNULL(grade, 0)) / COUNT(*) AS average
--       FROM students LEFT JOIN papers ON students.id = papers.student_id
--       GROUP BY students.id
--      ) AS avg_table
--      ORDER BY average DESC;
SELECT
  first_name,
  SUM(IFNULL(grade, 0)) / COUNT(*) AS average,
  CASE
    WHEN SUM(IFNULL(grade, 0)) / COUNT(*) >= 75 THEN 'PASSING'
    ELSE 'FAILING'
  END AS passing_status
FROM students
LEFT JOIN papers
  ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;