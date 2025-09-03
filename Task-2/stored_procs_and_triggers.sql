// stored_procs_and_triggers.sql

 1) Trigger: prevent inserting an order detail if product stock is insufficient
DELIMITER $$
CREATE TRIGGER trg_orderdetails_before_insert
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    DECLARE available INT;
    SELECT Stock INTO available FROM Products WHERE ProductID = NEW.ProductID;
    IF available < NEW.Quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for product';
    END IF;
END $$
DELIMITER ;

 2) Procedure: PlaceOrderSingle (one product per call)
--    Usage: CALL PlaceOrderSingle(customerID, productID, qty, 'Credit Card');
DROP PROCEDURE IF EXISTS PlaceOrderSingle;
DELIMITER $$
CREATE PROCEDURE PlaceOrderSingle(
    IN pCustomerID INT,
    IN pProductID INT,
    IN pQty INT,
    IN pMethod VARCHAR(50)
)
BEGIN
    DECLARE vPrice DECIMAL(10,2);
    DECLARE vStock INT;
    DECLARE vNewOrderID INT;

    START TRANSACTION;

    -- lock row to check stock
    SELECT Stock, Price INTO vStock, vPrice
    FROM Products
    WHERE ProductID = pProductID
    FOR UPDATE;

    IF vStock < pQty THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
    ELSE
        -- create order
        INSERT INTO Orders (CustomerID, OrderDate, Status)
        VALUES (pCustomerID, NOW(), 'Pending');
        SET vNewOrderID = LAST_INSERT_ID();

        -- insert order detail
        INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
        VALUES (vNewOrderID, pProductID, pQty);

        -- update stock
        UPDATE Products SET Stock = Stock - pQty WHERE ProductID = pProductID;

        -- insert payment (here we do immediate full payment)
        INSERT INTO Payments (OrderID, Amount, Method)
        VALUES (vNewOrderID, vPrice * pQty, pMethod);

        COMMIT;
    END IF;
END $$
DELIMITER ;
