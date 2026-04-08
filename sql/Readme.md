# SQL Use Case – Digital Library Audit System

## Overview
The Digital Library Audit System is a relational database project developed to manage book borrowing records in a college library.  
The system tracks issued books, identifies overdue returns, calculates penalties, and generates reports for popular book categories and inactive students.

This project demonstrates table creation, data insertion, joins, grouping, and analytical SQL queries.

---

## Business Case
A local community college maintains a library database for books and student borrow records.  
The administration needs to:

- Track overdue books
- Generate penalty report
- Identify most popular categories
- Detect inactive students
- Clean up old records

---

## Problem Statement
Create a relational system to track book loans and generate a penalty report for books not returned within 14 days.

---

## Tables Created

### Books
Stores book information

Columns:
- book_id
- title
- category

### Students
Stores student information

Columns:
- student_id
- name

### IssuedBooks
Stores book borrowing details

Columns:
- issue_id
- book_id
- student_id
- issue_date
- return_date

---

## Features

- Book loan tracking
- Overdue book detection (after 14 days)
- Penalty calculation based on overdue days
- Popular category report
- Inactive student detection
- Data cleanup query

---

## Queries Implemented

### 1. Overdue Penalty Report
Shows students who have not returned books after 14 days.

Includes:
- Student name
- Book title
- Issue date
- Days overdue
- Penalty amount

Penalty rule:
5 currency units per day after due date.

---

### 2. Popular Category Report
Finds the most borrowed category using:

- COUNT()
- GROUP BY

---

### 3. Inactive Students
Finds students who never borrowed books.

---

### 4. Data Cleanup
Deletes student records inactive for more than 3 years.

---

## SQL Concepts Used

- CREATE TABLE
- INSERT INTO
- SELECT
- WHERE
- GROUP BY
- COUNT
- JOIN
- DATE functions
- DELETE
- Subquery

---

## How to Run

1. Open MySQL / phpMyAdmin
2. Create database
digital_library
3. Run digital_library.sql
4. Execute queries

---

## Project Structure

sql_usecase
├── digital_library.sql
└── README.md
|__Sql_output.png

---

## Sample Output

### Overdue Penalty Report
Ravi DBMS 2026-03-01 50 250
Kiran Python 2026-03-10 41 205

### Popular Category
Technology 3
Science 2
History 1

### Inactive Students
Arjun


---

## Outcome
This project helps track book borrowing activity, generate overdue penalty reports, and analyze category popularity for better library management.
