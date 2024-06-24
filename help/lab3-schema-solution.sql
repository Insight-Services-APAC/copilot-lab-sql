-- This SQL script creates a table named 'Customer' in the database.
-- The 'Customer' table has the following columns:

-- 'CustomerID': This is the primary key for the table. It is of type UUID (Universally Unique Identifier), 
--               which means that each value in this column should be unique across all rows in the table.

-- 'Firstname': This column stores the first name of the customer. It is of type VARCHAR(255), 
--              which means it can store a string of up to 255 characters.

-- 'Lastname': This column stores the last name of the customer. It is also of type VARCHAR(255).

-- 'IsEnabled': This column stores a boolean value indicating whether the customer is enabled or not. 
--              It is of type BOOLEAN, which means it can store either true or false.
CREATE TABLE Customer (
    CustomerID UUID PRIMARY KEY,
    Firstname VARCHAR(255),
    Lastname VARCHAR(255),
    IsEnabled BOOLEAN,
    EmailAddress CITEXT DEFAULT NULL;
);
-- The Address table stores address information for customers.
-- Each row represents a unique address, identified by a unique AddressGUID.
-- The CustomerID column links the address to a specific customer in the Customer table.
-- AddressLine1, AddressLine2, City, State, and ZipCode store the actual address details.
-- IsShippingAddress and IsBillingAddress are boolean flags indicating if the address is used for shipping or billing.
CREATE TABLE Address (
    AddressGUID UUID PRIMARY KEY, -- Unique identifier for each address
    CustomerID UUID, -- Identifier for the customer, references Customer table
    AddressLine1 VARCHAR(255), -- First line of the address
    AddressLine2 VARCHAR(255), -- Second line of the address
    City VARCHAR(255), -- City of the address
    State VARCHAR(2), -- State of the address, stored as 2-letter abbreviation
    ZipCode VARCHAR(5), -- Zip code of the address
    IsShippingAddress BOOLEAN, -- Flag indicating if this is a shipping address
    IsBillingAddress BOOLEAN, -- Flag indicating if this is a billing address
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) -- Foreign key constraint linking to Customer table
);

-- The Orders table stores order information for customers.
-- Each row represents a unique order, identified by a unique OrderID.
-- The CustomerID column links the order to a specific customer in the Customer table.
-- OrderDate stores the date when the order was placed.
-- OrderDollarValue stores the total value of the order, with a precision of 10 digits and a scale of 2 digits.
-- OrderStatus stores the status of the order.
CREATE TABLE Orders (
    OrderID UUID PRIMARY KEY, -- Unique identifier for each order
    CustomerID UUID, -- Identifier for the customer, references Customer table
    OrderDate DATE, -- Date when the order was placed
    OrderDollarValue DECIMAL(10,2), -- Total value of the order, with a precision of 10 digits and a scale of 2 digits
    OrderStatus VARCHAR(255), -- Status of the order
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) -- Foreign key constraint linking to Customer table
);