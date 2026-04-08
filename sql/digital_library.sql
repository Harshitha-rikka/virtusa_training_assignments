-- creating tables

CREATE TABLE Books(
    book_id INT PRIMARY KEY,
    title VARCHAR(50),
    category VARCHAR(30)
);

CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IssuedBooks(
    issue_id INT PRIMARY KEY,
    book_id INT,
    student_id INT,
    issue_date DATE,
    return_date DATE
);

-- insert books

INSERT INTO Books VALUES
(1,'DBMS','Technology'),
(2,'Java','Technology'),
(3,'Python','Technology'),
(4,'History of India','History'),
(5,'Physics','Science'),
(6,'Chemistry','Science');

-- insert students

INSERT INTO Students VALUES
(101,'Ravi'),
(102,'Anu'),
(103,'Kiran'),
(104,'Meena'),
(105,'Arjun');

-- insert issued records

INSERT INTO IssuedBooks VALUES
(1,1,101,'2026-03-01',NULL),
(2,2,102,'2026-04-01','2026-04-05'),
(3,3,103,'2026-03-10',NULL),
(4,4,104,'2026-04-02','2026-04-06'),
(5,5,101,'2026-03-15',NULL),
(6,6,105,'2026-04-01','2026-04-03'),
(7,2,101,'2026-03-20',NULL);

--------------------------------------------------
-- Overdue penalty report (after 14 days)
--------------------------------------------------

SELECT 
s.name,
b.title,
i.issue_date,
DATE('now') AS today,
(DATE('now') - DATE(i.issue_date)) AS days_overdue,
((DATE('now') - DATE(i.issue_date)) * 5) AS penalty
FROM Students s, Books b, IssuedBooks i
WHERE s.student_id = i.student_id
AND b.book_id = i.book_id
AND i.return_date IS NULL
AND i.issue_date < DATE('now','-14 days');

--------------------------------------------------
-- Popular category report
--------------------------------------------------

SELECT 
b.category,
COUNT(*) AS total_borrowed
FROM Books b, IssuedBooks i
WHERE b.book_id = i.book_id
GROUP BY b.category DESC;

--------------------------------------------------
-- Inactive students
--------------------------------------------------

SELECT name
FROM Students
WHERE student_id NOT IN
(
SELECT student_id FROM IssuedBooks
);

--------------------------------------------------
-- Cleanup inactive (3 years)
--------------------------------------------------

DELETE FROM Students
WHERE student_id NOT IN
(
SELECT student_id
FROM IssuedBooks
WHERE issue_date >= DATE('now','-3 years')
);
