
DELIMITER //
CREATE PROCEDURE UpdateBooking (
    IN BookID INT,
    IN BookDate DATE
)
BEGIN
    UPDATE bookings
    SET BookingDate = BookDate
    WHERE BookingID = BookID;
    SELECT CONCAT('Booking ', BookID , ' is updated') AS Confirmation;
END//

DELIMITER ;
