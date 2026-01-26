use train;
-- Q1) 👥 Employees without Manager

-- Assume: The table Employee(emp_id, name, manager_id).

-- Question: Show employees who do not have a manager (null or no match).

-- output: emp_id|name
-- Step 1: Create the Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

-- Step 2: Insert random values
INSERT INTO Employee (emp_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- Alice has no manager (top-level)
(2, 'Bob', 1),            -- Bob reports to Alice
(3, 'Charlie', 1),        -- Charlie reports to Alice
(4, 'Diana', 2),          -- Diana reports to Bob
(5, 'Ethan', 2),          -- Ethan reports to Bob
(6, 'Fiona', 3),          -- Fiona reports to Charlie
(7, 'George', 3),         -- George reports to Charlie
(8, 'Hannah', 4),         -- Hannah reports to Diana
(9, 'Ian', 5),            -- Ian reports to Ethan
(10, 'Jane', 6);          -- Jane reports to Fiona

select emp_id, name from Employee where manager_id is null;
-- Q2) 🧹 Duplicate Records

-- Table: Person(name, Email_id)
-- Question: Find records with duplicate email in a Person table.

-- output: Email
-- Step 1: Create the Person table
CREATE TABLE Person (
    name VARCHAR(50),
    Email_id VARCHAR(100)
);

-- Step 2: Insert values including duplicates
INSERT INTO Person (name, Email_id) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Alice', 'alice@example.com'),   -- Duplicate entry
('Bob', 'bob@example.com'),       -- Duplicate entry
('David', 'david@example.com');
select distinct email_id from Person;
-- Q3) Nth Highest Salary

-- Table: Employee(emp_id, name, salary)
-- Question: Write a query to fetch the nth highest salary (replace n with a number).

-- output: emp_id|Emp_name|salary
-- Step 1: Create the Employee table
CREATE TABLE Employee1 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Step 2: Insert n employees with different salaries
INSERT INTO Employee1 (emp_id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 70000),
(4, 'Diana', 80000),
(5, 'Ethan', 90000),
(6, 'Fiona', 100000),
(7, 'George', 110000),
(8, 'Hannah', 120000),
(9, 'Ian', 130000),
(10, 'Jane', 140000);
select * from employee1 order by salary desc limit 4, 1;

-- Q4) Employees With Name Starting with ‘A’

-- Table: Employee(emp_id, name)
-- Question: Show employees whose name starts with the letter A.

-- output:Emp_id | Emp_name
select emp_id, name from employee1 where name like 'A%';
-- Q5) Highest Paid Employee in Each Department

-- Table: Employee(emp_id, name, salary, department_id)
-- Question: Show employee name, salary, and department of the highest paid employee in each department.

-- output:Name|salary|department_id
-- Step 1: Create the Employee table
CREATE TABLE Employee2 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT
);

-- Step 2: Insert sample data with different values
INSERT INTO Employee2 (emp_id, name, salary, department_id) VALUES
(1, 'Alice', 55000, 101),
(2, 'Bob', 62000, 102),
(3, 'Charlie', 70000, 101),
(4, 'Diana', 80000, 103),
(5, 'Ethan', 90000, 102),
(6, 'Fiona', 100000, 104),
(7, 'George', 110000, 103),
(8, 'Hannah', 120000, 104),
(9, 'Ian', 130000, 105),
(10, 'Jane', 140000, 101);
select name, salary, department_id from employee2 e 
where e.salary=(select Max(salary) from employee2 where e.department_id=department_id) order by e.salary desc;
-- Q6) Cumulative Salary per Department

-- Table: Employee(emp_id, name, salary, department_id)
-- Question: Show cumulative salary in each department using SUM() OVER(PARTITION BY department_id ORDER BY salary DESC).

-- output: name	salary	department_id	cumulative_salary
-- Using window function with PARTITION BY
SELECT 
    emp_id,
    name,
    department_id,
    salary,
    SUM(salary) OVER (PARTITION BY department_id) AS total_salary_per_dept
FROM employee2;
-- Q7) Employees Who Changed Departments

-- Tables:
-- EmployeeHistory(emp_id, department_id, from_date, to_date)
-- Question: Show employees who changed their department more than once.

-- Output: Emp_id 

-- Q8)Departments with No Employees

-- Tables: Departments(department_id, department_name)
-- Employee(emp_id, name, department_id)
-- Question: Show departments that have no employees (use LEFT JOIN).

-- output: department_id | department_name

-- Q9) Employee Count Per Manager

-- Table: Employee(emp_id, name, manager_id)
-- Question: Show number of employees reporting to each manager.

-- output: manager_id	employee_count

-- Q10)Department Salary Rank

-- Table: Employee(emp_id, name, salary, department_id)
-- Question: Rank employees within each department by salary using RANK() OVER(PARTITION BY department_id ORDER BY salary DESC).

-- output: name | salary | department_id | rank
SET @dept := NULL, @r := 0;

SELECT 
  department_id,
  name,
  salary,
  @r := IF(@dept = department_id, @r = @r + 1, 1) AS salary_rank,
  @dept := department_id AS dept_tracker
FROM employee2
ORDER BY department_id, salary DESC;