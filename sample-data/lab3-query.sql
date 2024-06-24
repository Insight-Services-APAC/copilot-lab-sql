SELECT C.Firstname, A.AddressLine1, A.AddressLine2, A.City, A.State, A.ZipCode
FROM Customer AS C
JOIN Address AS A ON CustomerID = A.CustomerID
WHERE A.IsShippingAddress = TRUE AND A.IsBillingAddress = FALSE;
ORDER BY C.Firstname
GROUP BY A.City 