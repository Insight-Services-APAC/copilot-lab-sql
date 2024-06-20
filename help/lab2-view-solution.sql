--------------
-- Create View
--------------

-- Note: This script is for PostgreSQL.

CREATE VIEW CustomerOrders AS
SELECT 
    c.Firstname,
    c.Lastname,
    o.OrderID,
    o.OrderDate,
    o.OrderDollarValue,
    o.OrderStatus
FROM 
    Customer c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID;

--------------
-- Update view
--------------

-- DROP VIEW IF EXISTS CustomerOrders;

CREATE VIEW CustomerOrders AS
SELECT 
    c.CustomerID,
    c.Firstname,
    c.Lastname,
    STRING_AGG(o.OrderID::text, ',') AS OrderIDs,
    STRING_AGG(o.OrderDate::text, ',') AS OrderDates,
    SUM(o.OrderDollarValue) AS TotalOrderDollarValue,
    STRING_AGG(o.OrderStatus, ',') AS OrderStatuses
FROM 
    Customer c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID;

--------------
-- Test view
--------------

SELECT * from customerorders
