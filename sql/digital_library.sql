CREATE TABLE Books(
    book_id INT,
    title VARCHAR(50),
    category VARCHAR(30),
    PRIMARY KEY(book_id)
);

CREATE TABLE Students(
    student_id INT,
    name VARCHAR(50),
    PRIMARY KEY(student_id)
);

CREATE TABLE IssuedBooks(
    issue_id INT,
    book_id INT,
    student_id INT,
    issue_date DATE,
    return_date DATE,
    PRIMARY KEY(issue_id)
);

INSERT INTO Books VALUES
(1,'DBMS','Technology'),
(2,'Java','Technology'),
(3,'Python','Technology'),
(4,'History of India','History'),
(5,'Physics','Science'),
(6,'Chemistry','Science');

INSERT INTO Students VALUES
(101,'Ravi'),
(102,'Anu'),
(103,'Kiran'),
(104,'Meena'),
(105,'Arjun');

INSERT INTO IssuedBooks VALUES
(1,1,101,'2026-03-01',NULL),
(2,2,102,'2026-04-01','2026-04-05'),
(3,3,103,'2026-03-10',NULL),
(4,4,104,'2026-04-02','2026-04-06'),
(5,5,101,'2026-03-15',NULL),
(6,6,105,'2026-04-01','2026-04-03'),
(7,2,101,'2026-03-20',NULL);

SELECT s.name, b.title, i.issue_date
FROM Students s, Books b, IssuedBooks i
WHERE s.student_id = i.student_id
AND b.book_id = i.book_id
AND i.return_date IS NULL;

SELECT b.category, COUNT(*)
FROM Books b, IssuedBooks i
WHERE b.book_id = i.book_id
GROUP BY b.category;

SELECT name
FROM Students
WHERE student_id NOT IN
(
SELECT student_id FROM IssuedBooks
);
