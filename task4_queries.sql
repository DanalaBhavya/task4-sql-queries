/*Basic SELECT*/
SELECT * FROM Customer LIMIT 5;


/*JOIN (Invoice + Customer)*/

SELECT Invoice.InvoiceId, Customer.FirstName, Customer.LastName, Invoice.Total
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Invoice.Total DESC;


/*Aggregates: Total Revenue by Country*/

SELECT Country, SUM(Total) AS TotalRevenue
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Country
ORDER BY TotalRevenue DESC;



/*Subquery: Customers who spent more than average*/

SELECT CustomerId, SUM(Total) AS TotalSpent
FROM Invoice
GROUP BY CustomerId
HAVING TotalSpent > (
  SELECT AVG(Total) FROM Invoice
);



/*To Find the Top 5 Selling Tracks by Revenue*/
SELECT Track.Name AS TrackName, 
       SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS TotalRevenue
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Track.TrackId
ORDER BY TotalRevenue DESC
LIMIT 5;


/*List Employees and Their Customers (LEFT JOIN)*/

SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       c.FirstName || ' ' || c.LastName AS CustomerName
FROM Employee e
LEFT JOIN Customer c ON e.EmployeeId = c.SupportRepId
ORDER BY EmployeeName;