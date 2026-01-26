-- 🧾 Table 1: employees
-- id	name	dept	salary	hire_date
-- 1️⃣ Department-wise Average Salary

-- Question:
-- Show each employee’s salary and the average salary of their department.

-- Output Columns:

-- id | name | dept | salary | dept_avg_salary
-- Create the employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Insert random values
INSERT INTO employees (id, name, dept, salary, hire_date) VALUES
(1, 'Alice Johnson', 'HR', 55000.00, '2020-03-15'),
(2, 'Brian Smith', 'IT', 72000.00, '2019-07-22'),
(3, 'Catherine Lee', 'Finance', 68000.00, '2021-01-10'),
(4, 'David Brown', 'Marketing', 60000.00, '2018-11-05'),
(5, 'Emily Davis', 'Sales', 50000.00, '2022-06-18');

select id, name , dept, salary, avg(salary) over(partition by dept) as dept_avg_salary from employees;
-- 2️⃣ Rank Employees by Salary in Each Department

-- Question:
-- Rank employees within each department based on salary (highest first).

-- Output Columns:

-- id | name | dept | salary | dept_rank

select id, name , dept, salary, rank() over(partition by dept) as dept_rank from employees;

-- 3️⃣ Running Total of Salary by Department

-- Question:
-- Calculate a running total of salary for each department ordered by hire date.

-- Output Columns:

-- id | name | dept | salary | running_salary_total

select id, name , dept, salary, sum(salary) over(order by salary) as running_salary_total from employees;

-- 4️⃣ Previous Employee Salary Comparison

-- Question:
-- Show each employee’s salary and the previous employee’s salary in the same department.

-- Output Columns:

-- id | name | dept | salary | prev_salary

select id, name , dept, salary, lag(salary) over(order by salary) as prev_salary from employees;

-- 5️⃣ Top 2 Highest Paid Employees per Department

-- Question:
-- Return employees who earn in the top 2 salaries of their department.

-- Output Columns:

-- id | name | dept | salary

SELECT id, name, dept, salary
FROM (
    SELECT id, name, dept, salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM employees
) AS ranked
WHERE rn <= 2;

-- 6️⃣ Bucket Employees into 3 Salary Groups

-- Question:
-- Divide employees into 3 salary buckets (low, medium, high).

-- Output Columns:

-- id | name | salary | salary_bucket

SELECT id, name, dept, ntile(3) over(order by salary desc) as salary_bucket from employees;

-- 7️⃣ First and Last Salary in Department

-- Question:
-- Show each employee’s salary along with the minimum and maximum salary in their department.

-- Output Columns:

-- id | name | dept | salary | min_salary | max_salary

SELECT id, name, dept, max(salary) over(partition by dept) as max_salary, min(salary) over(partition by dept) as min_salary from employees;

-- 8️⃣ Remove Duplicate Employees

-- Question:
-- Identify duplicate employee records based on name and department.

-- Output Columns:

-- id | name | dept | salary | row_num

SELECT id, name, dept, salary, row_number() over() as row_num from employees;

-- 🧾 Table 2: sales
-- order_id	customer_id	order_date	amount
-- Create the sales table
use training;
CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Insert random values
INSERT INTO sales (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2023-01-15', 250.75),
(102, 2, '2023-02-10', 120.00),
(103, 3, '2023-03-05', 560.40),
(104, 1, '2023-04-20', 310.25),
(105, 4, '2023-05-18', 450.00),
(106, 2, '2023-06-12', 95.50),
(107, 5, '2023-07-08', 780.90),
(108, 3, '2023-08-22', 150.00),
(109, 6, '2023-09-30', 640.35),
(110, 4, '2023-10-14', 220.00);
-- 9️⃣ Running Total of Sales

-- Question:
-- Calculate the running total of sales by order date.

-- Output Columns:

-- order_id | order_date | amount | running_total

SELECT order_id, order_date, amount, sum(amount) over(order by order_date) as running_total from sales;

-- 🔟 Month-over-Month Sales Growth

-- Question:
-- Calculate month-over-month sales difference.

-- Output Columns:

-- month | revenue | prev_month_revenue | growth

-- Create the sales table with order_month instead of order_date
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_month INT CHECK (order_month BETWEEN 1 AND 12),
    amount DECIMAL(10,2) NOT NULL
);

-- Insert random values into sales table
INSERT INTO sales (order_id, customer_id, order_month, amount) VALUES
(201, 1, 1, 250.75),
(202, 2, 2, 120.00),
(203, 3, 2, 560.40),
(204, 1, 4, 310.25),
(205, 4, 5, 450.00),
(206, 2, 6, 95.50),
(207, 5, 7, 780.90),
(208, 3, 8, 150.00),
(209, 6, 9, 640.35),
(210, 4, 10, 220.00),
(211, 7, 11, 330.10),
(212, 8, 12, 410.75);

SELECT order_month, lag(amount) over(order by order_month) as revenue, amount as prev_month_revenue, amount-lag(amount) over(order by order_month) as growth from sales;