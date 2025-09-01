-- Drop tables if they already exist (to avoid errors on re-run)
DROP TABLE IF EXISTS Issued_Books;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Categories;

-- ==============================
-- 1. Categories Table
-- ==============================
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- ==============================
-- 2. Members Table
-- ==============================
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE
);

-- ==============================
-- 3. Books Table
-- ==============================
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    CategoryID INT,
    PublishedYear INT,
    AvailableCopies INT DEFAULT 1,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- ==============================
-- 4. Issued_Books Table
-- ==============================
CREATE TABLE Issued_Books (
    IssueID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    IssueDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Fine DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
