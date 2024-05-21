
SELECT 
    MenuName
FROM
    menu
WHERE
    MenuName = ANY (SELECT 
            m.MenuName
        FROM
            orders o
                INNER JOIN
            menu m ON o.MenuID = m.MenuID
        WHERE
            o.Quantity > 2);