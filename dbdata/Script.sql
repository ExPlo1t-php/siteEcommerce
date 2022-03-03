CREATE DATABASE Store_Manager;
USE Store_Manager;

CREATE TABLE Client (
     clientId char(6) PRIMARY KEY,
     firstName VARCHAR(20),
     lastName VARCHAR(20),
     adress VARCHAR(30),
     telNum VARCHAR(14),
     email VARCHAR(30),
     pwd VARCHAR(30)
);

    INSERT INTO Client VALUES
    (1,'fn1','ln1','adr1','tel1','em1','ps1'),
    (2,'fn2','ln2','adr2','tel2','em2','ps2'),
    (3,'fn3','ln3','adr3','tel3','em3','ps3');


    CREATE TABLE Product (
        productId char(6) PRIMARY KEY,
        label VARCHAR(20),
        description VARCHAR(50),
        price DECIMAL(10,2),
        quantity_in_stock INT
    );

    INSERT INTO Product VALUES
    (1,'lb1','desc1',43,12),
    (2,'lb2','desc2',5,54),
    (3,'lb3','desc3',123,43);

    CREATE TABLE Order_ (
        orderId char(6) PRIMARY KEY,
        orderDate DATE,
        shippningAddr VARCHAR(50),
        clientId INT REFERENCES Client(clientId)
    );

    INSERT INTO Order_ VALUES
            (1,'2013-06-12','ad1',1),
            (2,'2014-06-01','ad2',2),
            (3,'2005-11-09','ad3',3);

    CREATE TABLE orderDetail(
            quantity INT,
            productId char(6),
            FOREIGN KEY(productId) REFERENCES Product(productId),
            orderId char(6),
            FOREIGN KEY(orderId) REFERENCES Order(orderId),
            PRIMARY KEY (productId, orderId)
    );
