CREATE OR REPLACE FUNCTION update_customer_email(customer_id UUID, new_email CITEXT)
RETURNS VOID AS $$
BEGIN
    -- Check if the email address is valid (basic check for format)
    IF new_email !~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
        RAISE EXCEPTION 'Invalid email format';
    END IF;

    -- Check if the customer exists
    IF NOT EXISTS (SELECT 1 FROM Customer WHERE CustomerID = customer_id) THEN
        RAISE EXCEPTION 'Customer does not exist';
    END IF;

    -- Update the customer's email address
    UPDATE Customer
    SET EmailAddress = new_email
    WHERE CustomerID = customer_id;
END;
$$ LANGUAGE plpgsql;