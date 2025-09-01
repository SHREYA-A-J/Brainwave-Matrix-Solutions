-- ==============================
-- 1. Show all available books
-- ==============================
SELECT BookID, Title, Author, PublishedYear, AvailableCopies
FROM Books
WHERE AvailableCopies > 0;

-- ==============================
-- 2. Show all members
-- ==============================
SELECT MemberID, MemberName, Email, Phone, JoinDate
FROM Members;

-- ==============================
-- 3. Show all books by category
-- ==============================
SELECT b.BookID, b.Title, b.Author, c.CategoryName, b.PublishedYear
FROM Books b
JOIN Categories c ON b.CategoryID = c.CategoryID
ORDER BY c.CategoryName;

-- ==============================
-- 4. Show all issued books with member details
-- ==============================
SELECT ib.IssueID, m.MemberName, b.Title, ib.IssueDate, ib.DueDate, ib.ReturnDate, ib.Fine
FROM Issued_Books ib
JOIN Members m ON ib.MemberID = m.MemberID
JOIN Books b ON ib.BookID = b.BookID;

-- ==============================
-- 5. Show overdue books (not returned & past due date)
-- ==============================
SELECT ib.IssueID, m.MemberName, b.Title, ib.IssueDate, ib.DueDate
FROM Issued_Books ib
JOIN Members m ON ib.MemberID = m.MemberID
JOIN Books b ON ib.BookID = b.BookID
WHERE ib.ReturnDate IS NULL AND ib.DueDate < CURDATE();

-- ==============================
-- 6. Show fines for members
-- ==============================
SELECT m.MemberName, b.Title, ib.Fine
FROM Issued_Books ib
JOIN Members m ON ib.MemberID = m.MemberID
JOIN Books b ON ib.BookID = b.BookID
WHERE ib.Fine > 0;

-- ==============================
-- 7. Count how many books in each category
-- ==============================
SELECT c.CategoryName, COUNT(b.BookID) AS TotalBooks
FROM Categories c
LEFT JOIN Books b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName;

-- ==============================
-- 8. Show most recently added members
-- ==============================
SELECT MemberName, Email, JoinDate
FROM Members
ORDER BY JoinDate DESC
LIMIT 5;
