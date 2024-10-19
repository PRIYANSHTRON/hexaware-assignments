CREATE DATABASE HMBank;

USE HMBank;

CREATE TABLE Customers(
	customer_id int PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50) not null,
	Date_of_Birth date not null,
	email varchar(320),
	phone_number varchar(15) not null,
	address varchar(300) not null
);


CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20) not null,
    balance DECIMAL(15, 2) default 0.00,
    CONSTRAINT FK_Customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT CHK_Account_Type CHECK (account_type IN ('savings', 'current', 'zero_balance'))
);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,                   
    account_id INT,                                  
    transaction_type VARCHAR(20) not null,                     
    amount DECIMAL(15, 2) default 0.00,                            
    transaction_date DATETIME not null,                        
    CONSTRAINT FK_Account FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    CONSTRAINT CHK_Transaction_Type CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')) 
);

