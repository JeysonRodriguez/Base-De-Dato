CREATE DATABASE hola;
USE hola;

CREATE TABLE orden(
Order_ID INT NOT NULL AUTO_INCREMENT unique,
OrderDate date NOT NULL,
Delivery_ID INT NOT NULL,
Customer_ID INT NOT NULL,
Product_ID INT NOT NULL,
PRIMARY KEY(Customer_ID),
CONSTRAINT FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID),
CONSTRAINT FOREIGN KEY (Delivery_ID) REFERENCES delivery(Delivery_ID),
CONSTRAINT FOREIGN KEY (Product_ID) references products(Product_ID)
)ENGINE = InnoDB;

CREATE TABLE delivery(
Delivery_ID INT NOT NULL auto_increment,
Tipo varchar(45) NOT NULL,
Estado BINARY(1) NOT NULL,
primary key (Delivery_ID)
)engine = InnoDB;

CREATE table products(
Product_ID INT NOT NULL auto_increment,
Product_Name varchar(45) not null,
Category_ID int not null,	
primary key (Product_ID),
constraint foreign key (Category_ID)references category (Category_ID)
)engine= InnoDB;

create table category(
Category_ID int not null auto_increment,
CategoryName varchar(45) not null,
CategoryType varchar (45) not null,
primary key(Category_ID)
)engine = InnoDB
