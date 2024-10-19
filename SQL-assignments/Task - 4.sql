use HMBank;

--1. Retrieve the customer(s) with the highest account balance.

SELECT 
    c.customer_id, 
    CONCAT(c.first_name,c.last_name) as customer_name, 
    a.account_id, 
    a.balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
WHERE 
    a.balance = (
        SELECT MAX(balance) 
        FROM Accounts
);


--2. Calculate the average account balance for customers who have more than one account.


SELECT 
    c.customer_id,
    CONCAT(c.first_name,c.last_name) AS customer_name,
    AVG(a.balance) AS average_balance
FROM 
    Accounts a
JOIN 
    Customers c ON a.customer_id = c.customer_id
WHERE 
    a.customer_id IN (
        SELECT customer_id 
        FROM Accounts 
        GROUP BY customer_id 
        HAVING COUNT(account_id) > 1
    )
GROUP BY 
    c.customer_id, c.first_name, c.last_name;



--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT 
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Transactions t
WHERE 
    t.amount > (SELECT AVG(amount) FROM Transactions);

select * from Customers;

--4. Identify customers who have no recorded transactions.

SELECT 
    c.customer_id, 
    c.first_name
FROM 
    Customers c
LEFT JOIN 
    Accounts a ON c.customer_id = a.customer_id
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    a.account_id IS NULL OR t.transaction_id IS NULL;




--5. Calculate the total balance of accounts with no recorded transactions.

SELECT 
    SUM(a.balance) AS total_balance
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_id IS NULL;




--6. Retrieve transactions for accounts with the lowest balance.

WITH LowestBalanceAccount AS (
    SELECT 
        account_id, balance
    FROM 
        Accounts
    WHERE 
        balance = (SELECT MIN(balance) FROM Accounts)
)
SELECT 
    t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date
FROM 
    Transactions t
JOIN 
    LowestBalanceAccount lba ON t.account_id = lba.account_id;



--7. Identify customers who have accounts of multiple types.

SELECT 
    c.customer_id, c.first_name, COUNT(DISTINCT a.account_type) AS type_count
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, c.first_name
HAVING 
    COUNT(DISTINCT a.account_type) > 1;




--8. Calculate the percentage of each account type out of the total number of accounts.

SELECT 
    account_type,
    COUNT(*) AS type_count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Accounts), 2) AS percentage
FROM 
    Accounts
GROUP BY 
    account_type;


--9. Retrieve all transactions for a customer with a given customer_id.

SELECT 
    t.transaction_id, 
    t.account_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
WHERE 
    a.customer_id = 2;


--10. Calculate the total balance for each account type, including a subquery within the SELECT 
--clause.


SELECT 
    account_type,
    (SELECT SUM(balance) 
     FROM Accounts a2 
     WHERE a2.account_type = a1.account_type
    ) AS total_balance
FROM 
    Accounts a1
GROUP BY 
    account_type;



