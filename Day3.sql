-- Question 1
-- Write an SQL query to display:
-- The First name (use alias Staff First Name), Position, and Salary of staff members where the salary is greater than 50000.
-- Your output should have three columns as given below:
-- output table:
-- STAFF FIRST NAME | POSITION | SALARY
create database train;
use train;
create table StaffSalary(
fristname varchar(20) ,
lastname varchar(10), 
Postion varchar(9) ,
salary Int);
insert into StaffSalary values("Vasan", "S", "Head", 60000),("Vasan", "S", "Head", 40000),("Vasan", "S", "Head", 10000);
select S.fristname as "Staff First Name" ,
	S.Postion ,
	S.salary 
from StaffSalary S 
where S.salary>50000;
-- Question 2
-- Write an SQL query to display:
-- The user_id, first_name, and last_name of the top 5 users who have sent the most messages, along with the number of messages they sent.
-- Display the output in descending order of user_id.
-- output table:
-- USER ID | FIRST NAME | LAST NAME | MESSAGES SENT
create table Message(UID int not null unique auto_increment,
fname varchar(20),
lname varchar(20),
messages int
);
insert into Message values(1, "Vasan", "S", 2), (2, "Vasan", "S", 5), (3, "Vasan", "S", 7),(4, "Vasan", "S", 10),(5, "Vasan", "S", 12),(6, "Vasan", "S", 15);
select uid as "USER ID",
fname as "FIRST NAME",
lname as "LAST NAME",
messages as "MESSAGES SENT"
from Message 
order by messages desc limit 5;

-- Question 3
-- Write an SQL query to display:
-- The Account_ID and Customer_ID of the accounts that have a balance greater than 6000.
-- output table:
-- ACCOUNT_ID | CUSTOMER_ID
 create table AccountDetails(CustomerId int,
 AccountId int,
 balance int);
 insert into AccountDetails values(1, 001, 7000), (2, 002, 8000), (3, 003, 3000);
 select AccountId, CustomerId from AccountDetails where balance>6000;

-- Question 4
-- Write an SQL query to display:
-- The room number, name of the hotel, and the check-out date of rooms that are currently occupied (status = 'Occupied').
-- Order the results by check-out date in ascending order.
-- output table:
-- ROOMNUMBER | HOTELNAME | CHECKOUTDATE
create table hotel (roomno int,
hotelname text,
statu text,
checkout date);
insert into hotel values(1, "RGH", "Occupied", '2026-09-21'),
(2, "RGH", "Unoccupied", '2025-09-21'),
(3, "RGH", "Unoccupied", '2025-09-22');
select roomno, hotelname, checkout from hotel where roomno not in (select roomno from hotel where statu ="Occupied") order by checkout;
-- Question 5
-- Write an SQL query to display:
-- The PatientID, PaymentStatus, and Outstanding amount (use alias Outstanding Amount) for patients whose bill has not been fully paid (i.e., PaidAmount is less than TotalAmount).
-- output table:
-- PATIENTID | PAYMENTSTATUS | OUTSTANDING AMOUNT
create table Payment(PID int, PayStatus text, paid int,  total int);
insert into Payment values(1, "paid", 300, 300), (2, "paid", 150, 300), (3, "Unpaid", 0, 300);
select PID as "PATIENTID",
PayStatus as "PAYMENTSTATUS",
total-paid as "OUTSTANDING AMOUNT"
from Payment
where paid<total;

-- Question 7
-- Write an SQL query to display:
-- The first name and last name of instructors, along with the count of ‘Computer Science’ courses they teach.
-- The result will be ordered by first name in alphabetical order.
-- output table:
-- INSTRUCTOR FIRST NAME | INSTRUCTOR LAST NAME | NUMBER OF COMPUTER SCIENCE COURSES
create table instructor(fname text,
lname text,
course text);
insert into instructor values("guvi", "g", "cs"), ("geek", "f", "cs"), ("geek", "f", "maths"), ("guvi", "g", "cs");
select fname as "INSTRUCTOR FIRST NAME",
lname as "INSTRUCTOR LAST NAME",
count(*) as "NUMBER OF COMPUTER COURSES"
from instructor where course="cs" group by fname, lname;

-- Question 8
-- Write an SQL query to display:
-- The post Id name, user Id and content of all comments where the comments start with the letter “I” and the post Id falls within the range of 1 to 5, including 1 and 5.
-- output table:
-- POST_ID | USER_ID | CONTENT
create table posts(pid int, uid int, comments text);
insert into posts values(6, 4, "i"), (3, 4, "i"), (5, 4, "i"), (1, 4, "i"),(2, 4, "u");
select pid as POST_ID, 
uid as USER_ID,
comments as CONTENT
from posts where pid<6 and pid>0 and comments like "i%" order by pid , uid;

-- Question 9
-- Write an SQL query to display:
-- The artist_name and follower_count of the most followed artist.
-- output table:
-- ARTIST_NAME | FOLLOWER_COUNT
create table Artist(aname text, fname text);
insert into Artist values("a1", "f1"), ("a2", "f2"), ("a2", "f2"), ("a2", "f2"),("a2", "f2"),("a1", "f1");
select aname as ARTIST_NAME,
count(fname) as FOLLEWER_COUNT
from Artist group by aname order by count(fname) limit 1; 

-- Question 10
-- Write an SQL query to display:
-- First name, last name, and Account ID of customers who have ever made a transaction of strictly greater than 30000.
-- Use alias as "First_Name", "Last_Name", and "Account_ID".
-- output table:
-- FIRST_NAME | LAST_NAME | ACCOUNT_ID
create table AccountDet(fname text, lname text, accountid int, transcat int);
insert into AccountDet values("V", "N", 1, 40000), ("S", "U", 2, 30000), ("B","M",3,50000);
select fname as FIRST_NAME,
lname as LAST_NAME,
accountid as ACCOUNT_ID
from AccountDet where transcat > 30000;
-- Question 1
-- Display the first name (as Staff First Name), position, and salary
-- of staff whose salary is greater than 50000.
-- CREATE TABLE Staff (
--  StaffID INT PRIMARY KEY,
--  FirstName VARCHAR(50),
--  Position VARCHAR(50),
--  Salary DECIMAL(10,2)
-- );
-- INSERT INTO Staff VALUES
-- (1, 'Arun', 'Manager', 75000),
-- (2, 'Meena', 'Clerk', 45000),
-- (3, 'Vijay', 'Supervisor', 52000),
-- (4, 'Divya', 'Assistant', 40000);
-- SELECT FirstName AS "Staff First Name", Position, Salary
-- FROM Staff
-- WHERE Salary > 50000;
-- Question 2
-- Display the user_id, first_name, and last_name of the top 5 users
-- who sent the most messages, along with the number of messages sent.
-- Show results in descending order of message count.
-- CREATE TABLE Messages (
--  Msg_ID INT PRIMARY KEY,
--  User_ID INT,
--  First_Name VARCHAR(50),
--  Last_Name VARCHAR(50),
--  Message_Text VARCHAR(100)
-- );
-- INSERT INTO Messages VALUES
-- (1, 101, 'Arun', 'Kumar', 'Hi'),
-- (2, 102, 'Meena', 'Ravi', 'Hello'),
-- (3, 101, 'Arun', 'Kumar', 'How are you'),
-- (4, 103, 'Vijay', 'Raj', 'Good'),
-- (5, 104, 'Divya', 'Singh', 'Nice'),
-- (6, 101, 'Arun', 'Kumar', 'Great'),
-- (7, 102, 'Meena', 'Ravi', 'Fine'),
-- (8, 101, 'Arun', 'Kumar', 'Thanks');
-- SELECT
--  User_ID,
--  First_Name,
--  Last_Name,
--  COUNT(Msg_ID) AS "Messages Sent"
-- FROM Messages
-- GROUP BY User_ID
-- ORDER BY COUNT(Msg_ID) DESC
-- LIMIT 5;
-- Question 3
-- Display the Account_ID and Customer_ID
-- of accounts having balance greater than 6000.
-- CREATE TABLE Accounts (
--  Account_ID INT PRIMARY KEY,
--  Customer_ID INT,
--  Balance DECIMAL(10,2)
-- );
-- INSERT INTO Accounts VALUES
-- (1, 201, 8000),
-- (2, 202, 4500),
-- (3, 203, 6500),
-- (4, 204, 3000);
-- SELECT Account_ID, Customer_ID
-- FROM Accounts
-- WHERE Balance > 6000;
-- Question 4
-- Display the room number, hotel name, and check-out date
-- for rooms that are currently occupied,
-- ordered by check-out date in ascending order.
-- CREATE TABLE Rooms (
--  RoomNumber INT PRIMARY KEY,
--  HotelName VARCHAR(50),
--  CheckOutDate DATE,
--  Status VARCHAR(20)
-- );
-- INSERT INTO Rooms VALUES
-- (101, 'Taj Hotel', '2025-11-10', 'Occupied'),
-- (102, 'Taj Hotel', '2025-11-12', 'Vacant'),
-- (103, 'Sunrise Inn', '2025-11-08', 'Occupied'),
-- (104, 'Lake View', '2025-11-15', 'Occupied');
-- SELECT RoomNumber, HotelName, CheckOutDate
-- FROM Rooms
-- WHERE Status = 'Occupied'
-- ORDER BY CheckOutDate ASC;
-- Question 5
-- Display PatientID, PaymentStatus, and Outstanding Amount
-- (TotalAmount - PaidAmount) where bills are not fully paid.
-- CREATE TABLE Patients (
--  PatientID INT PRIMARY KEY,
--  PaymentStatus VARCHAR(20),
--  TotalAmount DECIMAL(10,2),
--  PaidAmount DECIMAL(10,2)
-- );
-- INSERT INTO Patients VALUES
-- (1, 'Pending', 10000, 8000),
-- (2, 'Paid', 7000, 7000),
-- (3, 'Pending', 12000, 5000);
-- SELECT PatientID,
--  PaymentStatus,
--  (TotalAmount - PaidAmount) AS "Outstanding Amount"
-- FROM Patients
-- WHERE PaidAmount < TotalAmount;
-- Question 7
-- Display the first and last name of instructors,
-- along with the count of Computer Science courses they teach.
-- Order results alphabetically by first name.
-- CREATE TABLE Instructors (
--  InstructorID INT PRIMARY KEY,
--  InstructorFirstName VARCHAR(50),
--  InstructorLastName VARCHAR(50)
-- );
-- CREATE TABLE Courses (
--  CourseID INT PRIMARY KEY,
--  CourseName VARCHAR(50),
--  Department VARCHAR(50),
--  InstructorID INT
-- );
-- INSERT INTO Instructors VALUES
-- (1, 'Arun', 'Kumar'),
-- (2, 'Meena', 'Ravi'),
-- (3, 'Vijay', 'Raj');
-- INSERT INTO Courses VALUES
-- (101, 'Database Systems', 'Computer Science', 1),
-- (102, 'Operating Systems', 'Computer Science', 1),
-- (103, 'Networks', 'Computer Science', 2),
-- (104, 'Mathematics', 'Mathematics', 2),
-- (105, 'AI Fundamentals', 'Computer Science', 3);
-- SELECT InstructorFirstName,
--  InstructorLastName,
--  COUNT(*) AS "Number of Computer Science Courses"
-- FROM Instructors
-- JOIN Courses
--  ON Instructors.InstructorID = Courses.InstructorID
-- WHERE Courses.Department = 'Computer Science'
-- GROUP BY InstructorFirstName, InstructorLastName
-- ORDER BY InstructorFirstName ASC;
-- Question 8
-- Display post_id, user_id, and content of comments
-- where comments start with 'I' and post_id is between 1 and 5.
-- CREATE TABLE Comments (
--  Comment_ID INT PRIMARY KEY,
--  Post_ID INT,
--  User_ID INT,
--  Content VARCHAR(200)
-- );
-- INSERT INTO Comments VALUES
-- (1, 1, 11, 'I love this post!'),
-- (2, 2, 12, 'Interesting topic'),
-- (3, 3, 13, 'Nice explanation'),
-- (4, 4, 14, 'I agree with you'),
-- (5, 5, 15, 'Important discussion'),
-- (6, 6, 16, 'Great work');
-- SELECT
--  Post_ID,
--  User_ID,
--  Content
-- FROM Comments
-- WHERE Content LIKE 'I%'
--  AND Post_ID BETWEEN 1 AND 5;
-- Question 9
-- Display the artist name and follower count of the most followed artist.
-- CREATE TABLE Artists (
--  Artist_ID INT PRIMARY KEY,
--  Artist_Name VARCHAR(50),
--  Follower_Count INT
-- );
-- INSERT INTO Artists VALUES
-- (1, 'Arijit Singh', 5000000),
-- (2, 'Shreya Ghoshal', 7000000),
-- (3, 'Sid Sriram', 6500000);
-- SELECT
--  Artist_Name,
--  Follower_Count
-- FROM Artists
-- ORDER BY Follower_Count DESC
-- LIMIT 1;
-- Question 10
-- Display first name, last name, and Account ID of customers
-- who have ever made a transaction strictly greater than 30000.
-- CREATE TABLE Customers (
--  Customer_ID INT PRIMARY KEY,
--  First_Name VARCHAR(50),
--  Last_Name VARCHAR(50),
--  Account_ID INT
-- );
-- CREATE TABLE Transactions (
--  Transaction_ID INT PRIMARY KEY,
--  Account_ID INT,
--  Amount DECIMAL(10,2)
-- );
-- INSERT INTO Customers VALUES
-- (1, 'Arun', 'Kumar', 101),
-- (2, 'Meena', 'Ravi', 102),
-- (3, 'Vijay', 'Raj', 103),
-- (4, 'Divya', 'Singh', 104);
-- INSERT INTO Transactions VALUES
-- (1, 101, 25000),
-- (2, 102, 40000),
-- (3, 103, 15000),
-- (4, 104, 50000);
-- SELECT
--  c.First_Name AS "First_Name",
--  c.Last_Name AS "Last_Name",
--  c.Account_ID AS "Account_ID"
-- FROM Customers c
-- JOIN Transactions t ON c.Account_ID = t.Account_ID
-- WHERE t.Amount > 30000;