-- ==============================
-- Insert into Categories
-- ==============================
INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('Technology'),
('History'),
('Philosophy');

-- ==============================
-- Insert into Members
-- ==============================
INSERT INTO Members (MemberName, Email, Phone, JoinDate) VALUES
('John Doe', 'john@example.com', '9876543210', '2023-01-15'),
('Jane Smith', 'jane@example.com', '9123456780', '2023-02-10'),
('Ravi Kumar', 'ravi@example.com', '9998877665', '2023-03-05'),
('Aisha Khan', 'aisha@example.com', '9876501234', '2023-04-12'),
('Emily Davis', 'emily@example.com', '9988776655', '2023-05-01');

-- ==============================
-- Insert into Books
-- (Books linked with categories via CategoryID)
-- ==============================
INSERT INTO Books (Title, Author, CategoryID, PublishedYear, AvailableCopies) VALUES
('To Kill a Mockingbird', 'Harper Lee', 1, 1960, 5),
('1984', 'George Orwell', 1, 1949, 3),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2, 2011, 4),
('A Brief History of Time', 'Stephen Hawking', 3, 1988, 2),
('Clean Code', 'Robert C. Martin', 4, 2008, 6),
('The Art of Computer Programming', 'Donald Knuth', 4, 1968, 2),
('The Second World War', 'Antony Beevor', 5, 2012, 3),
('Meditations', 'Marcus Aurelius', 6, 180, 5);

-- ==============================
-- Insert into Issued_Books
-- (Sample issued books, some returned, some not)
-- ==============================
INSERT INTO Issued_Books (MemberID, BookID, IssueDate, DueDate, ReturnDate, Fine) VALUES
(1, 1, '2023-08-01', '2023-08-15', '2023-08-14', 0),
(2, 3, '2023-08-05', '2023-08-20', NULL, 0),
(3, 5, '2023-08-10', '2023-08-25', '2023-08-30', 50),
(4, 2, '2023-08-12', '2023-08-27', NULL, 0),
(5, 7, '2023-08-15', '2023-08-30', '2023-09-05', 100);
