CREATE VIEW OrderViews AS
    SELECT 
        OrderID, Quantity, BillAmount
    FROM
        orders
    WHERE
        Quantity > 2;
        
SELECT * FROM OrderViews;