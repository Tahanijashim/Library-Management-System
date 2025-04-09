Create database LibraryDB;
USE LibraryDB
Database creation
CREATE DATABASE LibraryDB;
USE LibraryDB;

# creating tables as per the schema
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year YEAR,
    status ENUM('Available','Borrowed') DEFAULT 'Available'
);

CREATE TABLE members(
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    address TEXT
);

CREATE TABLE librarians(
    librarian_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE borrowed_books(
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE DEFAULT CURRENT_DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

Step 2 #Insert Sample Data

INSERT INTO Books (title, author, genre, published_year, status) VALUES
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 'Available'),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 'Available'),
('1984', 'George Orwell', 'Dystopian', 1949, 'Available');

INSERT INTO Members (name, email, phone, address) VALUES
('John Doe', 'johndoe@email.com', '1234567890', '123 Main St'),
('Jane Smith', 'janesmith@email.com', '0987654321', '456 Oak St');

INSERT INTO Librarians (name, email, phone) VALUES
('Alice Brown', 'alicebrown@email.com', '1112223333');

step 3: Implement CRUD Operations
1. View all available books:
SELECT * FROM books
WHERE status = 'Available';

2. Add a new book:
INSERT ONTO books(title, author, genre, published_year, status) VALUES
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 'Available');

3. Update book status when borrowed:
UPDATE books SET status ='Borrowed'
WHERE book_id = 1;

4. Delete a member:
DELETE FROM members 
WHERE member_id  2;

STEP 5 Borrow & Return books
1.Borrow a book
INSERT INTO borrowed_books (book_id, member_id) VALUES (1, 1);
UPDATE books SET status = 'Borrowed' WHERE book_id = 1;

2.Return a book
UPDATE borrowed_books SET return_date = CURRENT_DATE WHERE book_id = 1 AND member_id = 1;
UPDATE Books SET status = 'Available' WHERE book_id = 1;

Step 6: Generate Reports
1.List of books currently borrowed
SELECT * FROM Books WHERE status = 'Borrowed';

2.Overdue books (assuming a 14-day borrow period)
SELECT * FROM Borrowed_Books WHERE return_date IS NULL AND 
borrow_date < (CURRENT_DATE - INTERVAL 14 DAY);