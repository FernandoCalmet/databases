-- ----------------------------
-- Table structure for Accounts
-- ----------------------------
CREATE TABLE Accounts(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    status VARCHAR(30) NOT NULL,
    createdDate DATETIME NOT NULL
);

-- ----------------------------
-- Table structure for Customer
-- ----------------------------
CREATE TABLE Customer(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    accountId INTEGER NOT NULL REFERENCES Accounts(id),
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    email NVARCHAR(50) UNIQUE NOT NULL,
    createdDate DATETIME NOT NULL
);

-- ----------------------------
-- Table structure for Address
-- ----------------------------
CREATE TABLE Address(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    accountId INTEGER NOT NULL REFERENCES Accounts(id),
    street NVARCHAR(100) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    zipcode VARCHAR(10) NOT NULL,
    createdDate DATETIME NOT NULL,
    lastUpdatedate DATETIME
);

-- ----------------------------
-- Table structure for CreditCard
-- ----------------------------
CREATE TABLE CreditCard(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    accountId INTEGER NOT NULL REFERENCES Accounts(id),
    nameOnCard VARCHAR(50) NOT NULL,
    number VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    expirationDate DATE NOT NULL,
    createdDate DATETIME NOT NULL,
    lastUpdatedate DATETIME
);

-- ----------------------------
-- Table structure for Shipment
-- ----------------------------
CREATE TABLE Shipment(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    addressId INTEGER NOT NULL REFERENCES Address(id),
    trackingId VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL,
    provider NVARCHAR(100) NOT NULL,
    price DECIMAL(18, 2) NOT NULL
);

-- ----------------------------
-- Table structure for Product
-- ----------------------------
CREATE TABLE Product(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    sku VARCHAR(12),
    size DECIMAL(18, 2),
    upc VARCHAR(12) NOT NULL,
    unitPrice DECIMAL(18, 2) NOT NULL,
    unitInStock INTEGER,
    createdDate DATETIME NOT NULL
);

-- ----------------------------
-- Table structure for Order
-- ----------------------------
CREATE TABLE Order(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    accountId INTEGER NOT NULL REFERENCES Accounts(id),
    shipmentId INTEGER NOT NULL REFERENCES Shipment(id),
    status VARCHAR(30) NOT NULL,
    totalAmount INTEGER NOT NULL,
    totalTax DECIMAL(18, 2),
    createdDate DATETIME NOT NULL
);

-- ----------------------------
-- Table structure for OrderDetails
-- ----------------------------
CREATE TABLE OrderDetails(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    orderId INTEGER NOT NULL REFERENCES Order(id),
    productId INTEGER NOT NULL REFERENCES Product(id),
    quantity INTEGER NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    tax DECIMAL(18, 2)
);

-- ----------------------------
-- Table structure for Payment
-- ----------------------------
CREATE TABLE Payment(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    orderId INTEGER NOT NULL REFERENCES Order(id),
    method VARCHAR(50) NOT NULL,
    totalAmount DECIMAL(18, 2) NOT NULL,
    transactionDate DATETIME NOT NULL
);