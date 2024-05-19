DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM orders
    LIMIT 1;
END //
DELIMITER ;


CALL GetMaxQuantity();