USE HMBank;

INSERT INTO Customers (customer_id, first_name, last_name, Date_of_Birth, email, phone_number, address)
VALUES 
(1, 'John', 'Doe', '1985-03-12', 'john.doe@example.com', '1234567890', '123 Elm Street, Springfield'),
(2, 'Jane', 'Smith', '1990-07-21', 'jane.smith@example.com', '9876543210', '456 Oak Avenue, Greenville'),
(3, 'Michael', 'Johnson', '1982-05-05', 'm.johnson@example.com', '1231231234', '789 Pine Road, Hillside'),
(4, 'Emily', 'Davis', '1995-10-10', 'emily.davis@example.com', '2342342345', '101 Maple Blvd, Centerville'),
(5, 'Robert', 'Brown', '1978-02-25', 'robert.brown@example.com', '3453453456', '202 Birch Drive, Riverside'),
(6, 'Laura', 'Garcia', '1987-11-13', 'laura.garcia@example.com', '4564564567', '303 Cedar Lane, Brooksville'),
(7, 'David', 'Martinez', '1992-04-18', 'david.martinez@example.com', '5675675678', '404 Spruce Path, Woodbridge'),
(8, 'Sarah', 'Wilson', '1991-09-30', 'sarah.wilson@example.com', '6786786789', '505 Redwood Way, Seaview'),
(9, 'James', 'Clark', '1980-12-15', 'james.clark@example.com', '7897897890', '606 Palm Court, Lakeview'),
(10, 'Olivia', 'Lopez', '1993-06-22', 'olivia.lopez@example.com', '8908908901', '707 Cypress Circle, Fairview');


INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
(1, 1, 'savings', 1500.00),
(2, 2, 'current', 3000.00),
(3, 3, 'zero_balance', 0.00),
(4, 4, 'savings', 500.00),
(5, 5, 'current', 4500.00),
(6, 6, 'savings', 2000.00),
(7, 7, 'zero_balance', 0.00),
(8, 8, 'current', 1000.00),
(9, 9, 'savings', 750.00),
(10, 10, 'current', 2500.00);


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(1, 1, 'deposit', 1000.00, '2024-09-01 09:00:00'),
(2, 1, 'withdrawal', 500.00, '2024-09-05 10:30:00'),
(3, 2, 'deposit', 2000.00, '2024-09-02 11:15:00'),
(4, 3, 'deposit', 100.00, '2024-09-03 12:45:00'),
(5, 4, 'withdrawal', 50.00, '2024-09-06 13:25:00'),
(6, 5, 'deposit', 500.00, '2024-09-07 14:10:00'),
(7, 6, 'transfer', 300.00, '2024-09-08 15:35:00'),
(8, 7, 'deposit', 50.00, '2024-09-09 16:00:00'),
(9, 8, 'withdrawal', 200.00, '2024-09-10 17:20:00'),
(10, 9, 'transfer', 150.00, '2024-09-11 18:40:00');


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(11, 1, 'withdrawal', 200.00, '2024-09-12 08:30:00'),
(12, 2, 'transfer', 1000.00, '2024-09-13 09:45:00'),
(13, 3, 'withdrawal', 50.00, '2024-09-14 10:15:00'),
(14, 4, 'deposit', 250.00, '2024-09-15 11:30:00'),
(15, 5, 'transfer', 200.00, '2024-09-16 12:00:00'),
(16, 6, 'withdrawal', 100.00, '2024-09-17 13:00:00'),
(17, 7, 'withdrawal', 25.00, '2024-09-18 14:10:00'),
(18, 8, 'deposit', 150.00, '2024-09-19 15:20:00'),
(19, 9, 'deposit', 300.00, '2024-09-20 16:30:00'),
(20, 1, 'transfer', 350.00, '2024-09-21 17:40:00');




select * from Customers;

select * from Accounts;

select * from Transactions;


--1. Write a SQL query to retrieve the name, account type and email of all customers.

SELECT 
    c.first_name,
    a.account_type,
    c.email
FROM 
    Customers c
INNER JOIN 
    Accounts a 
ON c.customer_id = a.customer_id;


--2. Write a SQL query to list all transaction corresponding customer.

SELECT 
    c.first_name,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Customers c
INNER JOIN 
    Accounts a ON c.customer_id = a.customer_id
INNER JOIN 
    Transactions t ON a.account_id = t.account_id;



--3. Write a SQL query to increase the balance of a specific account by a certain amount.

UPDATE Accounts
SET balance = balance + 500  
WHERE account_id = 5;

SELECT * from Accounts
WHERE account_id = 5;


--4. Write a SQL query to Combine first and last names of customers as a full_name.

SELECT 
    first_name + ' ' + last_name AS full_name
FROM 
    Customers;

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.

DELETE FROM Accounts
WHERE balance = 0 
AND account_type = 'savings';
 

--6. Write a SQL query to Find customers living in a specific city.

SELECT 
    first_name + ' ' + last_name AS full_name,
    address
FROM 
    Customers
WHERE address LIKE '%seaview%';


--7. Write a SQL query to Get the account balance for a specific account.

SELECT balance FROM Accounts
WHERE account_id = 4;  

--8. Write a SQL query to List all current accounts with a balance greater than $1,000.

SELECT * FROM Accounts
WHERE account_type = 'current'
AND balance > 1000;


--9. Write a SQL query to Retrieve all transactions for a specific account

SELECT * FROM Transactions
WHERE account_id = 7;  

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

SELECT account_id,customer_id,balance,ROUND(balance * 0.07,2) AS interest_accrued FROM Accounts
WHERE account_type = 'savings';


--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.

SELECT account_id,customer_id,account_type,balance FROM Accounts
WHERE balance < -1000;


--12. Write a SQL query to Find customers not living in a specific city

SELECT customer_id,first_name + ' ' + last_name AS full_name,address FROM Customers
WHERE address NOT LIKE '%seaview%';




select account_type from accounts
group by account_type
having count(account_type) = 2;

select count(*) as type from accounts
where account_type = 'savings';

select * from transactions;
where account_id = 1;

select sum(amount) as total_deposit FROM TRANSACTIONS
where transaction_type = 'deposit'
group by account_id;

