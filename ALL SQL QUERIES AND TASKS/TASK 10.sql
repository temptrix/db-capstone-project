
DELIMITER //
CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN BookDate DATE, IN TableNo INT)
BEGIN
	INSERT INTO bookings (BookingID, CustomerID, BookingDate, TableNo)
    VALUES (BookingID, CustomerID, BookingDate, TableNo);
    SELECT "New booking Added" AS Confirmation;
END//
DELIMITER ;
