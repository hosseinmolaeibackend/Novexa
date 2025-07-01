/* Create table and relations*/
create table customers(
Id INT Not Null primary key,
FirstName  Nvarchar(50) Not Null ,
Email Nvarchar(60) Not Null,
region Nvarchar(20)
);

Create table products(
Id INT Not Null primary key identity(1,1),
ProductName Nvarchar(50) Not Null,
ProductPrice Decimal(10,2),
Stock Int Not Null);

create table categories(
Id Int Not Null primary key Identity(1,1),
CategoryName Nvarchar(50) not null);

create table productAndCategory(
ProductId int not null,
CategoryId int not null,
primary key (ProductId,CategoryId),
foreign key (ProductId) references products(Id),
foreign key (CategoryId) references categories(Id)
);

CREATE TABLE [Order] (
    OrderId INT PRIMARY KEY IDENTITY,
    CustomerId INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    [Status] NVARCHAR(50),
    TotalAmount DECIMAL(18,2),
    FOREIGN KEY (CustomerId) REFERENCES customers(Id)
);

-- آیتم‌های سفارش
CREATE TABLE OrderItem (
    OrderItemId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    ProductId INT,
    Quantity INT,
    UnitPrice DECIMAL(18,2),
    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
    FOREIGN KEY (ProductId) REFERENCES products(Id)
);

-- جدول پرداخت‌ها
CREATE TABLE Payment (
    PaymentId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(18,2),
    PaymentMethod NVARCHAR(50),
    PaymentStatus NVARCHAR(50),
    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId)
);

-- جدول ارسال کالا
CREATE TABLE Shipment (
    ShipmentId INT PRIMARY KEY IDENTITY,
    OrderId INT,
    Address NVARCHAR(300),
    ShippedDate DATETIME,
    DeliveryStatus NVARCHAR(50),
    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId)
);


create table customers_logs(
Logs_Id INT Identity(1,1) primary key,
opertions Nvarchar(10),
oldFirstName  Nvarchar(50) Not Null ,
newFirstName  Nvarchar(50) Not Null ,
oldEmail Nvarchar(60) Not Null,
newEmail Nvarchar(60) Not Null,
oldregion Nvarchar(20),
newregion Nvarchar(20)
);


select * from customers

select * from [Order]

select * from products

select * from OrderItem

select * from Payment

select * from shipment