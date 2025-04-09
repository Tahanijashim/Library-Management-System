# Library-Management-System
A simple SQL-based Library Management System to manage books, members, borrowing records, and librarians. Built for learning and practicing database design, SQL queries, and data handling.
Project Overview
This project simulates the backend of a library system using MySQL. It supports:

# Book inventory management
Member and librarian records
Borrowing and returning of books
Simple reporting and CRUD operations
🧱 Database Schema
📘 Books
book_id (Primary Key)
title
author
genre
published_year
status — Available / Borrowed
# 👤 Members
member_id (Primary Key)
name
email
phone
address
# 🧑‍💼 Librarians
librarian_id (Primary Key)
name
email
phone
# 🔄 Borrowed_Books
borrow_id (Primary Key)
book_id (Foreign Key → Books)
member_id (Foreign Key → Members)
borrow_date
return_date
💡 Features
# View all available books
Add, update, and delete books and members
Borrow and return books
Generate reports:
List of borrowed books
Overdue books (beyond 14 days)
# ⚙️ Technologies Used
MySQL (SQL)
InnoDB Storage Engine
SQL Scripts for setup and operations
# 🔧 Setup Instructions
Install MySQL and a client like phpMyAdmin.
Clone this repo and open the SQL script (library_management.sql).
Execute step-by-step or all at once:
Create the database
Create tables
Insert sample data
Perform queries and operations
