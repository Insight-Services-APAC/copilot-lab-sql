SELECT C.Firstname, A.AddressLine1, A.AddressLine2, A.City, A.State, A.ZipCode
FROM Customer AS C
JOIN Address AS A ON C.CustomerID = A.CustomerID
WHERE A.IsShippingAddress = TRUE AND A.IsBillingAddress = FALSE
GROUP BY C.Firstname, A.AddressLine1, A.AddressLine2, A.City, A.State, A.ZipCode
ORDER BY C.Firstname