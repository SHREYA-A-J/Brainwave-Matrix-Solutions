//insert_data.sql

 *Customers*
INSERT INTO Customers (CustomerName, Email, Phone, Address)
VALUES
('Alice Johnson','alice@mail.com','9876543210','Bengaluru'),
('Bob Smith','bob@mail.com','9123456789','Mumbai'),
('Carol Lee','carol@mail.com','9000000000','Delhi');

 *Products*
INSERT INTO Products (ProductName, Category, Price, Stock) VALUES
('Laptop','Electronics',60000.00,10),
('Headphones','Electronics',2000.00,50),
('Bookshelf','Furniture',7000.00,15),
('Mouse','Electronics',500.00,100),
('Notebook','Stationery',50.00,200);

 *Orders* (we insert explicit OrderIDs for sample clarity)
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status) VALUES
(1001, 1, '2025-07-01 10:00:00', 'Pending'),
(1002, 2, '2025-07-05 15:30:00', 'Shipped');

 *OrderDetails*
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1001, 1, 1),  -- Alice ordered 1 Laptop
(2, 1001, 2, 2),  -- Alice ordered 2 Headphones
(3, 1002, 3, 1);  -- Bob ordered 1 Bookshelf

 *Payments*
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, Method) VALUES
(5001, 1001, '2025-07-01 10:05:00', 64000.00, 'Credit Card'),
(5002, 1002, '2025-07-05 15:40:00', 7000.00, 'UPI');
