--Update the address of a customer
UPDATE Customer
SET Address = 'New Address'
WHERE Customer_ID = {customer_id};

--Update the order status of an order
UPDATE Orders
SET Order_Status = 'Completed'
WHERE Order_ID = 12345;

--Update the price of a laundry item
UPDATE LaundryItems
SET Price = 10.00
WHERE IS_ID = {item_id};
