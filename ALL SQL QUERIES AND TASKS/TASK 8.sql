DELIMITER //
CREATE PROCEDURE CheckBooking (IN BookingDate DATE, IN TableNo INT)
BEGIN
    DECLARE is_booked INT;

SELECT 
    EXISTS( SELECT 
            1
        FROM
            bookings
        WHERE
            BookingDate = BookingDate
                AND TableNo = TableNo)
INTO is_booked;

    IF is_booked = 1 THEN 
        SELECT CONCAT('Table ', TableNo , ' is already booked for ', BookingDate) AS BookingStatus;
    ELSE
        SELECT CONCAT('Table ', TableNo , ' is available for booking on ', BookingDate) AS BookingStatus;
    END IF;
END//
DELIMITER ;

