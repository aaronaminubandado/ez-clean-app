--Retrieve all laundry items and their prices
SELECT Item_Name, Price
FROM LaundryItems;

--Retrieve all orders with their order status and delivery status
SELECT o.Order_ID, o.Order_Status, d.Delivery_Status
FROM Orders o
JOIN Delivery d ON o.Order_ID = d.Order_ID;

--List all orders for a particular user in a specific month
SELECT *
FROM Orders
WHERE Customer_ID = {customer_id}
  AND MONTH(Order_Date) = {month};

--List all the invoices that have been paid
SELECT *
FROM Invoices
WHERE Payment_Status = 'Paid';

--List all of the orders whose delivery status is delivered
SELECT o.*
FROM Orders o
JOIN Delivery d ON o.Order_ID = d.Order_ID
WHERE d.Delivery_Status = 'Delivered';

--List the items selected by a user for a particular order
SELECT li.Item_Name
FROM ContainsTable ct
JOIN LaundryItems li ON ct.IS_ID = li.IS_ID
WHERE ct.Order_ID = {order_id};

--List all the details of employees who received orders on a particular day
SELECT e.*
FROM Employees e
JOIN Orders o ON e.Employee_ID = o.Employee_ID
WHERE o.Order_Date = 'YYYY-MM-DD';

--List the details of the orders received by a specific employee
SELECT o.*
FROM Orders o
WHERE o.Employee_ID = {employee_id};

--List all the orders that an individual employee delivers
SELECT o.*
FROM Orders o
JOIN Delivery d ON o.Order_ID = d.Order_ID
WHERE d.Employee_ID = {employee_id};

--Identify all the orders whose delivery has been completed
SELECT o.*
FROM Orders o
JOIN Delivery d ON o.Order_ID = d.Order_ID
WHERE d.Delivery_Status = 'Delivered' AND o.Order_Status = 'Completed';

--Retrieve the average price of laundry items
SELECT AVG(Price)
FROM LaundryItems;

--List all orders with their details and the customer's email address
SELECT o.*, c.Email
FROM Orders o
JOIN Customer c ON o.Customer_ID = c.Customer_ID;

--Retrieve all orders for a specific customer
SELECT *
FROM Orders
WHERE Customer_ID = {customer_id};

--List all the employees who are drivers
SELECT *
FROM Employees
WHERE Position = 'Driver';

--List all the employees who have confirmed payments from users
SELECT *
FROM Employees
WHERE Employee_ID IN (
    SELECT DISTINCT Employee_ID
    FROM Invoices
    WHERE Payment_Status = 'Paid'
);

--calculate the total price of all items for all users in the contains table 
SELECT c.Name, SUM(li.Price) AS TotalPrice
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN ContainsTable ct ON o.Order_ID = ct.Order_ID
JOIN LaundryItems li ON ct.IS_ID = li.IS_ID
GROUP BY c.Customer_ID, c.Name;

--show all the delivered orders handled by an employee
SELECT o.Order_ID, o.Order_Status, o.Details, d.Delivery_Status
FROM Orders o
JOIN Delivery d ON o.Order_ID = d.Order_ID
JOIN Employees e ON d.Employee_ID = e.Employee_ID
WHERE e.Employee_ID = {employee_id}
  AND d.Delivery_Status = 'Delivered';

--show all orders handled by an employee between two dates
SELECT o.Order_ID, o.Order_Status, o.Details, o.Order_Date
FROM Orders o
JOIN Employees e ON o.Employee_ID = e.Employee_ID
WHERE e.Employee_ID = {employee_id}
  AND o.Order_Date >= 'start_date'
  AND o.Order_Date <= 'end_date';

--show all orders handled by an employee between two dates
SELECT o.Order_ID, o.Order_Status, o.Details, o.Order_Date
FROM Orders o
JOIN Employees e ON o.Employee_ID = e.Employee_ID
WHERE e.Employee_ID = 1234567
  AND o.Order_Date >= '2023-05-01'
  AND o.Order_Date <= '2023-05-05';
