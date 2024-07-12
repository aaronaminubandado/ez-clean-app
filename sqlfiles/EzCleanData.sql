-- Populating Customer table
INSERT INTO Customer (Customer_ID, Name, Address, PhoneNo, Email, Payment_Info) VALUES
(123456, 'John Doe', '123 Main St', '555-1234', 'johndoe@example.com', 'Credit Card'),
(234567, 'Jane Smith', '456 Elm St', '555-5678', 'janesmith@example.com', 'PayPal'),
(345678, 'Michael Johnson', '789 Oak St', '555-9012', 'michaeljohnson@example.com', 'Cash'),
(456789, 'Sarah Williams', '987 Pine St', '555-3456', 'sarahwilliams@example.com', 'Credit Card'),
(567890, 'David Davis', '654 Maple St', '555-7890', 'daviddavis@example.com', 'Cash');

-- Populating Employees table
INSERT INTO Employees (Employee_ID, FirstName, Surname, Gender, Position, PhoneNo) VALUES
(1234567, 'John', 'Smith', 'Male', 'Cleaner', '555-1111'),
(2345678, 'Jane', 'Johnson', 'Female', 'Supervisor', '555-2222'),
(3456789, 'Michael', 'Williams', 'Male', 'Driver', '555-3333'),
(4567890, 'Sarah', 'Davis', 'Female', 'Cleaner', '555-4444'),
(5678901, 'David', 'Brown', 'Male', 'Supervisor', '555-5555'),
(6789012, 'Emily', 'Wilson', 'Female', 'Cleaner', '555-6666'),
(7890123, 'Daniel', 'Taylor', 'Male', 'Driver', '555-7777'),
(8901234, 'Olivia', 'Anderson', 'Female', 'Cleaner', '555-8888'),
(9012345, 'James', 'Martinez', 'Male', 'Supervisor', '555-9999');

-- Populating Orders table
INSERT INTO Orders (Order_ID, Order_Status, Details, Order_Date, Customer_ID, Employee_ID) VALUES
(12345, 'Pending', 'Regular cleaning', '2023-05-01', 123456, 1234567),
(23456, 'Completed', 'Deep cleaning', '2023-05-02', 234567, 2345678),
(34567, 'In Progress', 'Laundry service', '2023-05-03', 345678, 3456789),
(45678, 'Completed', 'Dry cleaning', '2023-05-04', 456789, 4567890),
(56789, 'Pending', 'Regular cleaning', '2023-05-05', 567890, 5678901);

-- Populating Invoices table
INSERT INTO Invoices (Invoice_code, Amount, Invoice_Date, Customer_ID, Receipt, Order_ID, Employee_ID, Payment_Status, Completion_Date) VALUES
(12345678, 50.00, '2023-05-10', 123456, 'ABC123', 12345, 1234567, 'Paid', '2023-05-11'),
(23456789, 75.00, '2023-05-11', 234567, 'DEF456', 23456, 2345678, 'Pending', NULL),
(34567890, 100.00, '2023-05-12', 345678, 'GHI789', 34567, 3456789, 'Paid', '2023-05-13'),
(45678901, 60.00, '2023-05-13', 456789, 'JKL012', 45678, 4567890, 'Paid', '2023-05-14'),
(56789012, 80.00, '2023-05-14', 567890, 'MNO345', 56789, 5678901, 'Pending', NULL);

-- Populating Delivery table
INSERT INTO Delivery (Order_ID, Employee_ID, Delivery_Status) VALUES
(12345, 1234567, 'Delivered'),
(23456, 2345678, 'In Transit'),
(34567, 3456789, 'Pending'),
(45678, 4567890, 'Delivered'),
(56789, 5678901, 'In Transit');

-- Populating Laundry Items and Services table
INSERT INTO LaundryItems(IS_ID, Item_Name, Service, Price) VALUES
(1234, 'Shirt', 'Dry Cleaning', 5.00),
(2345, 'Dress', 'Dry Cleaning', 10.00),
(3456, 'Pants', 'Laundry', 3.50),
(4567, 'Suit', 'Dry Cleaning', 15.00),
(5678, 'Blanket', 'Laundry', 8.00);

-- Populating Contains table
INSERT INTO ContainsTable(Order_ID, IS_ID) VALUES
(12345, 1234),
(12345, 2345),
(23456, 3456),
(34567, 4567),
(56789, 5678);

