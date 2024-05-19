-- Create the CancelOrder Procedure

DELIMITER //
CREATE PROCEDURE CancelOrder(IN order_ID INT)
BEGIN
    DELETE FROM orders 
    WHERE orderID = order_ID;
    
    SELECT CONCAT('Order', order_id, ' is cancelled.') AS Confirmation;
END //
DELIMITER ;

-- Delete order 10

call CancelOrder(10);

SELECT 
    *
FROM
    orders;
