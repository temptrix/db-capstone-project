PREPARE GetOrderDetail FROM "SELECT orderID, Quantity, BillAmount FROM orders WHERE CustomerID = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;