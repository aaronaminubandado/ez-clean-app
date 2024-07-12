--Customer Table
CREATE TABLE Customer(
    Customer_ID INT PRIMARY KEY NOT NULL,
    CustomerName VARCHAR(255) NOT NULL,
    CustomerAddress VARCHAR(255) NOT NULL,
    PhoneNo VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Payment_Info VARCHAR(255) NOT NULL
);

--Employee Table
CREATE TABLE Employees(
    Employee_ID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    PhoneNo VARCHAR(20) NOT NULL
);

--Order Table
CREATE TABLE Orders(
    Order_ID  INT PRIMARY KEY NOT NULL,
    Order_Status VARCHAR(255) NOT NULL,
    Details VARCHAR(255) NOT NULL,
    Order_Date DATE NOT NULL,
    Customer_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

--Invoice Table
CREATE TABLE Invoices(
    Invoice_code INT PRIMARY KEY NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Invoice_Date DATE NOT NULL,
    Customer_ID INT NOT NULL,
    Receipt VARCHAR(255) NOT NULL,
    Order_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    Payment_Status VARCHAR(255) NOT NULL,
    Completion_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

--Delivery Table
CREATE TABLE Delivery(
    Order_ID INT NOT NULL,
    Employee_ID INT NOT NULL, 
    Delivery_Status VARCHAR(255) NOT NULL,
    PRIMARY KEY (Order_ID,Employee_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

--Laundry Items and Services Table
CREATE TABLE LaundryItems(
    IS_ID INT PRIMARY KEY NOT NULL,
    Item_Name VARCHAR(255) NOT NULL,
    Service VARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

--Contains Table
CREATE TABLE ContainsTable(
    Order_ID INT NOT NULL,
    IS_ID INT NOT NULL, 
    PRIMARY KEY (Order_ID, IS_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (IS_ID) REFERENCES LaundryItems(IS_ID)
);