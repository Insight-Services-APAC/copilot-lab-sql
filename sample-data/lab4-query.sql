-- Uncomment each query if you want to run it.
-- When asking GitHub Copilot to explain the query, highlight it in the editor 
-- and then ask Copilot Chat to explain just the highlighted code.

------
-- Query 1
------

SELECT * FROM (
    SELECT DISTINCT c.CustomerID, c.Firstname, c.Lastname, a.addressline1, addressline2, a.city, a.zipcode
    FROM Customer c
    JOIN Orders o ON c.CustomerID = o.CustomerID AND c.IsEnabled IS TRUE
    JOIN Address a ON c.CustomerID = a.CustomerID AND a.IsShippingAddress IS TRUE
    WHERE o.OrderStatus = 'Shipped'
    AND o.OrderDollarValue > 500.00
) AS RandomCustomer
ORDER BY RANDOM()
LIMIT 1;


------
-- Query 2
------

-- SELECT addressguid, state, count(*)
-- FROM address
-- GROUP BY CUBE(addressguid, state)

------
-- Query 3
-- Note: does not refer to deployed tables/schema
------

-- SELECT custno + 1
-- FROM cust a
-- WHERE NOT EXISTS
-- (
-- SELECT  NULL
-- FROM cust b
-- WHERE a.custno = b.custno + 1
-- )
-- ORDER BY custno