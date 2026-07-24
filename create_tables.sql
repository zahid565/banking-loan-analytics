CREATE DATABASE banking_analytics;

USE banking_analytics;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    income DECIMAL(15,2),
    employment_type VARCHAR(50),
    city VARCHAR(50),
    branch VARCHAR(50)
);
CREATE TABLE loans (
    loan_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    loan_type VARCHAR(50),
    loan_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    loan_date DATE,
    loan_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
CREATE TABLE payments (
    payment_id VARCHAR(20) PRIMARY KEY,
    loan_id VARCHAR(20),
    payment_date DATE,
    amount_paid DECIMAL(15,2),
    payment_status VARCHAR(30),

    FOREIGN KEY (loan_id)
    REFERENCES loans(loan_id)
);