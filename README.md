# 🏦 Bank Management System
## 📌 Project Overview

The Bank Management System is a relational database project developed to demonstrate core DBMS concepts using SQL. This system manages basic banking operations such as:

- Customer management
- Account management
- BankTransaction records
- Loan management

The project is designed with 4 tables and includes 5 records per table, as per academic requirements.

### 🗂️ Database Design
### 📊 Entities Used (4 Tables)

- Customer
- Account
- BankTransaction
- Loan

### 🔗 Relationships

- One Customer → Many Accounts
- One Account → Many Transactions
- One Customer → Many Loans

The database is structured using Primary Keys and Foreign Keys to maintain referential integrity.

### 🛠️ Technologies Used

- SQL (MS-SQL SSMS)
- Relational Database Concepts
- ER Modeling

### 📁 Database Schema
### 1️⃣ Customer

- customer_id (Primary Key)
- name
- phone
- address

### 2️⃣ Account

- account_id (Primary Key)
- customer_id (Foreign Key)
- account_type
- balance

### 3️⃣ BankTransaction

- transaction_id (Primary Key)
- account_id (Foreign Key)
- transaction_type
- amount
- transaction_date

### 4️⃣ Loan

- loan_id (Primary Key)
- customer_id (Foreign Key)
- loan_amount
- loan_type

## 🔍 SQL Concepts Implemented

This project demonstrates the following DBMS concepts:

### ✅ 1. JOIN Operations

- INNER JOIN
- LEFT JOIN

Used to retrieve related data from multiple tables.

### ✅ 2. Aggregate Functions

- SUM()
- AVG()
- GROUP BY
Used for financial analysis and data summarization.

### ✅ 3. Subqueries

Used to:

- Compare loan amounts with average loan amount
- Compare account balances with average balance

### ✅ 4. Views

A virtual table was created:

`CustomerAccountView`

Used to simplify complex queries.

### ✅ 5. Transactions

- START TRANSACTION
- COMMIT
- ROLLBACK

Used to maintain data integrity and demonstrate ACID properties.

## 💡 Features

- Structured relational database design
- Data integrity using foreign keys
- Financial data analysis using SQL functions
- Transaction management
- Clean and normalized schema

## 📌 Learning Outcomes

Through this project, we learned:

- ER Diagram design
- Relational schema creation
- Primary & Foreign key constraints
- Data manipulation using SQL
- Transaction control
- Practical implementation of DBMS concepts

## 📌 Conclusion

This project demonstrates how a relational database system can efficiently manage banking operations. It highlights the importance of proper database design, normalization, and transaction management in real-world applications.
