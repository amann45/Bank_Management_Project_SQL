CREATE database bankmgmt;
use bankmgmt;


-- customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100)
);

-- account table
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- transaction table
CREATE TABLE BankTransaction (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- loan table
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10,2),
    loan_type VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- inserting data/records in all tables

INSERT INTO Customer VALUES
(1, 'Ram Sharma', '9811111111', 'Kathmandu'),
(2, 'Sita Karki', '9822222222', 'Pokhara'),
(3, 'Hari Thapa', '9833333333', 'Lalitpur'),
(4, 'Gita Rai', '9844444444', 'Biratnagar'),
(5, 'Krishna Lama', '9855555555', 'Chitwan');

INSERT INTO Account VALUES
(101, 1, 'Savings', 50000.00),
(102, 2, 'Current', 75000.00),
(103, 3, 'Savings', 62000.00),
(104, 4, 'Fixed', 150000.00),
(105, 5, 'Savings', 45000.00);

INSERT INTO BankTransaction VALUES
(1001, 101, 'Deposit', 10000.00, '2026-01-10'),
(1002, 102, 'Withdrawal', 5000.00, '2026-01-11'),
(1003, 103, 'Deposit', 20000.00, '2026-01-12'),
(1004, 104, 'Withdrawal', 10000.00, '2026-01-13'),
(1005, 105, 'Deposit', 15000.00, '2026-01-14');

INSERT INTO Loan VALUES
(201, 1, 200000.00, 'Home Loan'),
(202, 2, 150000.00, 'Car Loan'),
(203, 3, 100000.00, 'Education Loan'),
(204, 4, 250000.00, 'Business Loan'),
(205, 5, 80000.00, 'Personal Loan');

SELECT * FROM Customer;
SELECT * FROM Account;
SELECT * FROM BankTransaction;
SELECT * FROM Loan;

--Q1 Write a SQL query to display the customer name, account type, and balance of all customers using INNER JOIN between Customer and Account tables.

SELECT c.name, a.account_type, a.balance
FROM Customer c
INNER JOIN Account a
ON c.customer_id = a.customer_id;

--Q2 Write a SQL query to display all customers and their loan amounts using LEFT JOIN between Customer and Loan tables.

SELECT c.name, l.loan_amount
FROM Customer c
LEFT JOIN Loan l
ON c.customer_id = l.customer_id;

--Q3 Write a SQL query to display the customer name, loan type, and loan amount for customers who have taken loans using INNER JOIN between Customer and Loan tables.

SELECT c.name, l.loan_type, l.loan_amount
FROM Customer c
INNER JOIN Loan l
ON c.customer_id = l.customer_id;

--Q4 Write a SQL query to count the total number of customer in the bank.

SELECT COUNT(customer_id) as total_customers
FROM Customer;

--Q5 Write a SQL query to calculate the total balance for each account type using GROUP BY and SUM.

SELECT account_type, SUM(balance) AS total_balance
FROM Account
GROUP BY account_type;

--Q6 Write a SQL query to calculate the average loan amount of all customers using the AVG() function.

SELECT AVG(loan_amount) AS average_loan
FROM Loan;

--Q7 Write a SQL query to display the account_id and balance of accounts whose balance is greater than the average account balance using a subquery.

SELECT account_id, balance
FROM Account
WHERE balance > (
    SELECT AVG(balance)
    FROM Account
);

--Q8 Write a SQL query to display the names of customers whose loan amount is greater than the average loan amount using a subquery.

SELECT name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Loan
    WHERE loan_amount > (SELECT AVG(loan_amount) FROM Loan)
);

--Q9 Write a SQL query to create a view named CustomerAccountView that shows customer name, account type, and balance.

CREATE VIEW CustomerAccountView AS
SELECT c.name, a.account_type, a.balance
FROM Customer c
JOIN Account a
ON c.customer_id = a.customer_id;

--Q10 Write a SQL query to retrieve all data from the created view.

SELECT * FROM CustomerAccountView;

--Q11 Write a SQL transaction to deduct Rs. 5000 from account_id 101 and commit the changes.

BEGIN TRANSACTION;

UPDATE Account
SET balance = balance - 5000
WHERE account_id = 101;

COMMIT;

SELECT * FROM Account WHERE account_id=101;

--Q12 Write a SQL transaction to deduct Rs. 5000 from account_id 101 but rollback the changes instead of saving them.

BEGIN TRANSACTION;

UPDATE Account
SET balance = balance - 5000
WHERE account_id = 101;

ROLLBACK;

SELECT * FROM Account WHERE account_id=101;