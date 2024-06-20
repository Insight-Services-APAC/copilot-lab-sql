--------------
-- Create Function
--------------

-- Notes: 
-- - This script is for PostgreSQL.
-- - This only solves one challenge from the lab activity.

-- This stored procedure takes a customer ID as input and returns the total number of orders for that customer.
CREATE OR REPLACE FUNCTION GetTotalOrdersForCustomer(customer_id UUID)
RETURNS INTEGER AS $$
BEGIN
    RETURN (SELECT COUNT(*) FROM Orders WHERE CustomerID = customer_id);
END;
$$ LANGUAGE plpgsql;

--------------
-- Optimisation
--------------

CREATE INDEX idx_orders_customerid ON Orders(CustomerID);

--------------
-- Test Function
--------------

SELECT GetTotalOrdersForCustomer('6a1cf3dd-2281-41ec-8847-bab8411dbc6c');
