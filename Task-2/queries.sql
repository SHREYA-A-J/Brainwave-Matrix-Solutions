//queries.sql

 1) Show all products in stock
SELECT ProductID, ProductName, Category, Price, Stock
FROM Products
WHERE Stock > 0;

 2) Customer's order history
SELECT o.OrderID, o.OrderDate, o.Status, p.ProductName, od.Quantity, (od.Quantity * p.Price) AS ItemTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.CustomerID = 1
ORDER BY o.OrderDate DESC;

 3) Order totals
SELECT o.OrderID, SUM(od.Quantity * p.Price) AS OrderTotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID;

 4) Total sales by month
SELECT DATE_FORMAT(o.OrderDate, '%Y-%m') AS YearMonth, SUM(od.Quantity * p.Price) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY YearMonth
ORDER BY YearMonth DESC;

 5) Top selling products (by quantity)
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS QtySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID
ORDER BY QtySold DESC
LIMIT 10;

 6) Pending orders (not shipped)
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Status = 'Pending';


*Verify with Queries*
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Payments;

*Test the Transactional Procedures*
CALL PlaceOrderSingle(1, 2, 2, 'Credit Card'); -- Alice buying 2 Headphones
-- Check stock reduced:
SELECT ProductID, ProductName, Stock FROM Products WHERE ProductID = 2;
-- Check order created:
SELECT * FROM Orders WHERE CustomerID = 1 ORDER BY OrderDate DESC LIMIT 5;
SELECT * FROM OrderDetails WHERE OrderID = (SELECT MAX(OrderID) FROM Orders);
SELECT * FROM Payments WHERE OrderID = (SELECT MAX(OrderID) FROM Orders);

*Test an insufficient-stock case*
CALL PlaceOrderSingle(1, 1, 9999, 'UPI'); -- should throw "Insufficient stock"


