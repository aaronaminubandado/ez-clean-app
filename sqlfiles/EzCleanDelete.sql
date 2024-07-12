--Delete a specific customer
DELETE FROM Customer
WHERE Customer_ID = {customer_id};

--Delete all orders with a specific order status
DELETE FROM Orders
WHERE Order_Status = 'Cancelled';

--Delete all invoices that are not paid
DELETE FROM Invoices
WHERE Payment_Status = 'Paid';

--Delete all orders placed by a specific customer
DELETE FROM Orders
WHERE Customer_ID = {customer_id};

--Delete all orders delivered by a specific employee
DELETE FROM Orders
WHERE Employee_ID = {employee_id}
  AND Order_ID IN (SELECT Order_ID FROM Delivery WHERE Delivery_Status = 'Delivered');

--Delete all records from the ContainsTable for a specific order
DELETE FROM ContainsTable
WHERE Order_ID = {order_id};
