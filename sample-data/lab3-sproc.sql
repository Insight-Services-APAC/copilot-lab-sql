CREATE OR REPLACE FUNCTION update_existing_customer_email(customer_id UUID, new_email CITEXT)
RETURNS VOID AS $$
BEGIN
    -- Update the customer's email address
    UPDATE Customer
    SET EmailAddress = new_email
    WHERE CustomerID = customer_id;
END;
$$ LANGUAGE plpgsql;