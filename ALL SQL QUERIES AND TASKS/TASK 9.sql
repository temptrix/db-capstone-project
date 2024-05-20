DROP PROCEDURE IF EXISTS AddValidBooking

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_count INT;

    START TRANSACTION;

    INSERT INTO bookings (BookingDate, TableNo) VALUES (booking_date, table_number);

    SELECT COUNT(*) INTO booking_count FROM bookings WHERE BookingDate = booking_date AND TableNo = table_number;

    IF booking_count > 1 THEN
        ROLLBACK;
        SELECT 'This table is already booked on the specified date. Booking declined.' AS Bookingstatus;
    ELSE
        COMMIT;
        SELECT 'Booking successful.' AS BookingStatus;
    END IF;

END //

DELIMITER ;
