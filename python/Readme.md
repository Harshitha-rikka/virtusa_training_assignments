# Python Use Case – Smart Expense Tracker

## Overview
This project is a simple Smart Expense Tracker built using Python.  
It allows users to record daily expenses, categorize them, and generate monthly summaries.  
The program stores data in a CSV file and shows spending analysis including a pie chart.

The goal of this project is to understand file handling, dictionary usage, and basic data analysis in Python.

---

## Problem Statement
Many individuals struggle to track daily expenses and understand spending patterns.  
This application helps users log expenses and analyze their spending.

---

## Features

- Add daily expense
- Store data in CSV file
- View all expenses
- Monthly summary
- Category-wise breakdown
- Highest spending category
- Pie chart visualization
- CLI menu based system

---

## Data Stored

Each expense includes:

- Date
- Category
- Amount
- Description

Example:
2026-04-01,Food,200,Lunch
2026-04-02,Travel,300,Bus


---

## Menu Options


1 Add Expense
2 View Expenses
3 Monthly Summary
4 Exit


---

## Monthly Summary

The program calculates:

- Total monthly expense
- Category wise spending
- Highest spending category
- Pie chart showing distribution

Example Output:


Total Expense: 1000

Category Wise:
Food : 200
Travel : 300
Bills : 500

Highest Spending: Bills


After this, a pie chart is displayed showing category distribution.

---

## Concepts Used

- Python
- CSV file handling
- Dictionary
- Loops
- Functions
- Conditional statements
- Matplotlib for pie chart

---

## How to Run

Install matplotlib (only once):
pip install matplotlib

Run program:

python expense_tracker.py
---

## Project Structure

python_usecase
|__ piechart_output.png
|__ view_expenses.png
├── smart_expense_tracker.py
├── expenses.csv
└── README.md

---

## Outcome
This project helps users track their expenses and understand spending patterns using summaries and pie chart visualization.
