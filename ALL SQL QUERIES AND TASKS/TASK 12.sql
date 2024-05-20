
DELIMITER //
CREATE PROCEDURE CancelBooking (
    IN BookID INT
)
BEGIN
    DELETE FROM bookings
    WHERE BookingID = BookID;
    SELECT CONCAT('Booking ', BookID , ' is cancelled') AS Confirmation;
END//

DELIMITER ;


