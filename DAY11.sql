/*✅ Question 1: Extract Email Domain
Table: employees
Column Name	Data Type
emp_id		INT
full_name	VARCHAR
email		VARCHAR

❓ Question
Write an SQL query to extract the email domain (text after @) for each employee.

📤 Output Table
| emp_id | email_domain |*/
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO employees (emp_id, full_name, email) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Brian Smith', 'brian.smith@example.Lee'),
(3, 'Catherine', 'catherine.lee@example.com'),
(4, 'David Brown', 'david.brown@example.com'),
(5, 'Emily Davis', 'emily.davis@example.com'),
(6, 'Frank Wilson', 'frank.wilson@example.com'),
(7, 'Grace', 'Miller@example.com'),
(8, 'Henry Clark', 'henry.clark@example.com'),
(9, 'Isabella Moore', 'isabella.moore@example.com'),
(10, 'Jack Taylor', 'jack.taylor@example.com');

SELECT SUBSTRING(email from position('@'IN email)+1) from employees;

-- uestion 6: Combine First and Last Name
-- Table: users
-- Column Name	Data Type
-- user_id	INT
-- first_name	VARCHAR
-- last_name	VARCHAR

-- ❓ Question
-- Concatenate first name and last name with a space in between.

-- 📤 Output Table
-- | user_id | full_name |
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
INSERT INTO users (user_id, first_name, last_name) VALUES
(1, 'Alice', 'Johnson'),
(2, 'Brian', 'Smith'),
(3, 'Catherine', 'Lee'),
(4, 'David', 'Brown'),
(5, 'Emily', 'Davis'),
(6, 'Frank', 'Wilson'),
(7, 'Grace', 'Miller'),
(8, 'Henry', 'Clark'),
(9, 'Isabella', 'Moore'),
(10, 'Jack', 'Taylor');
select Concat(first_name," ", last_name) as full_name from users;

-- estion 7: Extract Year from Order ID
-- Table: orders
-- Column Name	Data Type
-- order_id	VARCHAR
-- order_date	DATE

-- ❓ Question
-- Order IDs are in the format ORD-2023-001. Extract the year from the order ID.

-- 📤 Output Table
-- | order_id | order_year |

CREATE TABLE orderw (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL
);
INSERT INTO orderw (order_id, order_date) VALUES
('ORD001', '2023-01-15'),
('ORD002', '2023-02-10'),
('ORD003', '2023-03-05'),
('ORD004', '2023-04-20'),
('ORD005', '2023-05-18'),
('ORD006', '2023-06-12'),
('ORD007', '2023-07-08'),
('ORD008', '2023-08-22'),
('ORD009', '2023-09-30'),
('ORD010', '2023-10-14');
select concat(substring(order_id from 1 for 3), "-", Date_format(order_date, '%Y'), "-", substring(order_id from 4)) from orderw;

-- uestion 9: Extract Username from Email
-- Table: accounts
-- Column Name	Data Type
-- account_id	INT
-- email		VARCHAR
-- created_at	DATE

-- ❓ Question
-- Emails are in the format username@domain.com. Extract the username part.

-- 📤 Output Table
-- | account_id | username |
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO employees (emp_id, full_name, email) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Brian Smith', 'brian.smith@example.Lee'),
(3, 'Catherine', 'catherine.lee@example.com'),
(4, 'David Brown', 'david.brown@example.com'),
(5, 'Emily Davis', 'emily.davis@example.com'),
(6, 'Frank Wilson', 'frank.wilson@example.com'),
(7, 'Grace', 'Miller@example.com'),
(8, 'Henry Clark', 'henry.clark@example.com'),
(9, 'Isabella Moore', 'isabella.moore@example.com'),
(10, 'Jack Taylor', 'jack.taylor@example.com');
SELECT SUBSTRING(email from 1 for position('@'IN email)-1) from employees;

-- estion 10: Mask Credit Card Number
-- Table: payments
-- Column Name	Data Type
-- payment_id	INT
-- card_number	VARCHAR

-- ❓ Question
-- Mask the credit card number so that only the last 4 digits are visible (e.g., XXXX-XXXX-1234).

-- 📤 Output Table
-- | payment_id | masked_card |
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    card_number VARCHAR(20) NOT NULL
);
INSERT INTO payments (payment_id, card_number) VALUES
(1, '4532758493021456'),
(2, '5500123498765432'),
(3, '6011987654321234'),
(4, '3714496353984931'),
(5, '3056930902590496'),
(6, '4111111111111111'),
(7, '5105105105105100'),
(8, '6011111111111117'),
(9, '3530111333300000'),
(10, '5555555555554444');
select concat('XXXX-XXXX-XXXX-', substring(card_number from 13)) from payments;

-- Question 8: Count Characters in Feedback
-- Table: feedback
-- Column Name	Data Type
-- feedback_id	INT
-- comments	VARCHAR

-- ❓ Question
-- Find the number of characters in each feedback comment.

-- 📤 Output Table
-- | feedback_id | comment_length |
CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    comments VARCHAR(255) NOT NULL
);
INSERT INTO feedback (feedback_id, comments) VALUES
(1, 'Great service, very satisfied!'),
(2, 'Delivery was late but product quality is good.'),
(3, 'Customer support was helpful and resolved my issue quickly.'),
(4, 'Website is easy to navigate and user-friendly.'),
(5, 'Prices are reasonable compared to competitors.'),
(6, 'I had trouble with payment processing.'),
(7, 'Product packaging was excellent.'),
(8, 'Would recommend to friends and family.'),
(9, 'The mobile app needs improvement.'),
(10, 'Overall experience was positive.');
select CHAR_LENGTH(comments) from feedback;

-- Question 2: Convert Names to Uppercase
-- Table: customers
-- Column Name	Data Type
-- customer_id	INT
-- customer_name	VARCHAR
-- city		VARCHAR

-- ❓ Question
-- Display customer names in uppercase along with their city.

-- 📤 Output Table
-- | customer_id | customer_name_upper | city |
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100) NOT NULL,
    CITY VARCHAR(100) NOT NULL
);
INSERT INTO CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, CITY) VALUES
(1, 'ALICE JOHNSON', 'NEW YORK'),
(2, 'BRIAN SMITH', 'LOS ANGELES'),
(3, 'CATHERINE LEE', 'CHICAGO'),
(4, 'DAVID BROWN', 'HOUSTON'),
(5, 'EMILY DAVIS', 'PHOENIX'),
(6, 'FRANK WILSON', 'PHILADELPHIA'),
(7, 'GRACE MILLER', 'SAN ANTONIO'),
(8, 'HENRY CLARK', 'DALLAS'),
(9, 'ISABELLA MOORE', 'SAN DIEGO'),
(10, 'JACK TAYLOR', 'SAN JOSE');
select CUSTOMER_ID, lOWER(CUSTOMER_NAME), City from CUSTOMER;

-- Question 3: Find Length of Product Names
-- Table: products
-- Column Name	Data Type
-- product_id	INT
-- product_name	VARCHAR
-- category	VARCHAR

-- ❓ Question
-- Write a query to find the length of each product name.

-- 📤 Output Table
-- | product_id | product_name_length |
CREATE TABLE PRODUCT (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100) NOT NULL,
    CATEGORY VARCHAR(50) NOT NULL
);
INSERT INTO PRODUCT (PRODUCT_ID, PRODUCT_NAME, CATEGORY) VALUES
(1, 'LAPTOP', 'ELECTRONICS'),
(2, 'SMARTPHONE', 'ELECTRONICS'),
(3, 'TABLET', 'ELECTRONICS'),
(4, 'HEADPHONES', 'ACCESSORIES'),
(5, 'KEYBOARD', 'ACCESSORIES'),
(6, 'CHAIR', 'FURNITURE'),
(7, 'DESK', 'FURNITURE'),
(8, 'REFRIGERATOR', 'APPLIANCES'),
(9, 'MICROWAVE', 'APPLIANCES'),
(10, 'WASHING MACHINE', 'APPLIANCES');
SELECT PRODUCT_ID, CHAR_LENGTH(PRODUCT_NAME) FROM PRODUCT;

-- uestion 5: Replace Characters in Phone Number
-- Table: contacts
-- Column Name	Data Type
-- contact_id	INT
-- phone_number	VARCHAR

-- ❓ Question
-- Replace all hyphens (-) in phone numbers with spaces.

-- 📤 Output Table
-- | contact_id | formatted_phone |
CREATE TABLE CONTACTS (
    CONTACT_ID INT PRIMARY KEY,
    PHONE_NUMBER VARCHAR(15) NOT NULL
);
INSERT INTO CONTACTS (CONTACT_ID, PHONE_NUMBER) VALUES
(1, '9876543210'),
(2, '9123456780'),
(3, '9988776655'),
(4, '9001122334'),
(5, '9445566778'),
(6, '9556677889'),
(7, '9667788990'),
(8, '9778899001'),
(9, '9889900112'),
(10, '9990011223');
SELECT CONCAT(SUBSTRING(PHONE_NUMBER FROM 1 FOR 3), "-", SUBSTRING(PHONE_NUMBER FROM 4 FOR 3), "-", SUBSTRING(PHONE_NUMBER FROM 7)) FROM CONTACTS;

-- Question 4: Extract First 3 Characters of City
-- Table: locations
-- Column Name	Data Type
-- location_id	INT
-- city		VARCHAR
-- country		VARCHAR

-- ❓ Question
-- Extract the first 3 characters of each city name.

-- 📤 Output Table
-- | location_id | city_code |
CREATE TABLE LOCATIONS (
    LOCATION_ID INT PRIMARY KEY,
    CITY VARCHAR(100) NOT NULL,
    COUNTRY VARCHAR(100) NOT NULL
);
INSERT INTO LOCATIONS (LOCATION_ID, CITY, COUNTRY) VALUES
(1, 'NEW YORK', 'USA'),
(2, 'LOS ANGELES', 'USA'),
(3, 'CHICAGO', 'USA'),
(4, 'LONDON', 'UK'),
(5, 'MANCHESTER', 'UK'),
(6, 'PARIS', 'FRANCE'),
(7, 'BERLIN', 'GERMANY'),
(8, 'TOKYO', 'JAPAN'),
(9, 'SYDNEY', 'AUSTRALIA'),
(10, 'TORONTO', 'CANADA');

SELECT LOCATION_ID, SUBSTRING(CITY FROM 1 FOR 3) FROM LOCATIONS;
use training;

-- create
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales');
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', 'Sales');

-- fetch 
/*create view sample as select customer_id, first_name from customers;
select * from sample;*/
create index sam on EMPLOYEE(empId);
show index from EMPLOYEE;
drop index sam on EMPLOYEE;
