SELECT 
    c.CustomerID,
    CONCAT(c.CustFirstName, ' ', c.CustLastName) AS FullName,
    o.OrderID,
    o.BillAmount,
    m.MenuName,
    mi.Courses,
    mi.Starters
FROM
    Orders o
        INNER JOIN
    Customers c ON o.CustomerID = c.CustomerID
        INNER JOIN
    Menu m ON o.MenuID = m.MenuID
        INNER JOIN
    MenuItem mi ON m.ItemID = mi.ItemID
WHERE
    o.BillAmount > 150
ORDER BY o.BillAmount ASC;