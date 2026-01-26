-- 1️⃣ List all employees with their last login date
-- (Include employees who have never logged in)
-- Actual Tables
-- Employees
-- | emp_id | name |
-- Logins
-- | emp_id | login_datetime |
-- Requirement
-- Display all employees.
-- If an employee has never logged in, show NULL for the login date.
-- If an employee has logged in multiple times, display only the most recent login date.
-- Output Table

-- | name | last_login_date |
-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create Logins table
CREATE TABLE Logins (
    emp_id INT,
    login_datetime DATETIME,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert random employees
INSERT INTO Employees (emp_id, name) VALUES
(101, 'Arjun Kumar'),
(102, 'Priya Sharma'),
(103, 'Rohan Mehta'),
(104, 'Sneha Iyer'),
(105, 'Vivek Reddy');

-- Insert random login records
INSERT INTO Logins (emp_id, login_datetime) VALUES
(101, '2026-01-05 09:15:23'),
(102, '2026-01-06 14:42:10'),
(103, '2026-01-07 08:03:55'),
(104, '2026-01-07 18:27:41'),
(105, NULL),
(101, '2026-01-08 09:01:44'),
(103, '2026-01-08 09:12:30'),
(102, '2026-01-08 09:25:18');

select E.name, date(MAX(L.login_datetime)) as last_login from Employees E right join Logins L on E.emp_id = L.emp_id 
group by E.name order by last_login desc;


-- List all employees with the total number of days since they joined
-- Actual Tables
-- Employees
-- | emp_id | name | join_date |
-- Requirement
-- Display employee name and the number of days since their joining date.
-- Calculate days from join_date to today’s date.
-- Output Table
-- | name | days_since_joined |

-- Create Employees table
use sakila;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    join_date DATE
);

-- Insert random employee records
INSERT INTO Employees (emp_id, name, join_date) VALUES
(201, 'Arjun Kumar', '2022-03-15'),
(202, 'Priya Sharma', '2021-07-09'),
(203, 'Rohan Mehta', '2023-01-22'),
(204, 'Sneha Iyer', '2020-11-30'),
(205, 'Vivek Reddy', '2024-05-18'),
(206, 'Ananya Gupta', '2022-09-12'),
(207, 'Karan Singh', '2023-06-25'),
(208, 'Meera Nair', '2021-02-14');

select name, (current_date-join_date) as NoofDate from Employees;

--  List all employees who joined in the year 2024
-- Actual Tables
-- Employees
-- | emp_id | name | join_date |
-- Requirement
-- Display only employees whose joining year is 2024.
-- Use date functions to filter the data.
-- Output Table
-- | name | join_date |
select name from Employees where year(join_date) = 2024;

--  Display department-wise latest hire date
-- Actual Tables
-- Employees
-- | emp_id | name | dept_id | join_date |
-- Departments
-- | dept_id | dept_name |
-- Requirement
-- Display each department name.
-- Show the most recent joining date in each department.
-- Output Table
-- | dept_name | latest_join_date |

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert random departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert random employees
INSERT INTO Employees (emp_id, name, dept_id, join_date) VALUES
(101, 'Arjun Kumar', 3, '2022-03-15'),
(102, 'Priya Sharma', 1, '2021-07-09'),
(103, 'Rohan Mehta', 2, '2023-01-22'),
(104, 'Sneha Iyer', 4, '2020-11-30'),
(105, 'Vivek Reddy', 5, '2024-05-18'),
(106, 'Ananya Gupta', 3, '2022-09-12'),
(107, 'Karan Singh', 2, '2023-06-25'),
(108, 'Meera Nair', 1, '2021-02-14'),
(109, 'Rahul Verma', 4, '2022-12-05'),
(110, 'Divya Patel', 5, '2023-08-19');
select d.dept_name, e.join_date as latest_join_date from Employees e join Departments d on e.dept_id=d.dept_id order by e.join_date desc limit 1;

-- List all employees who logged in within the last 7 days
-- Actual Tables
-- Employees
-- | emp_id | name |
-- Logins
-- | emp_id | login_datetime |
-- Requirement
-- Display employees who logged in during the last 7 days from today.
-- Consider date and time while filtering.
-- Output Table
-- | name | login_datetime |

-- Create Employees table
Create database training;
use training;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create Logins table
CREATE TABLE Logins (
    emp_id INT,
    login_datetime DATETIME,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert random employees
INSERT INTO Employees (emp_id, name) VALUES
(1, 'Arjun Kumar'),
(2, 'Priya Sharma'),
(3, 'Rohan Mehta'),
(4, 'Sneha Iyer'),
(5, 'Vivek Reddy');

-- Insert random login records (last 7 days from today: 2026-01-08)
INSERT INTO Logins (emp_id, login_datetime) VALUES
(1, '2026-01-01 09:15:23'),
(2, '2026-01-03 14:42:10'),
(3, '2026-01-04 08:03:55'),
(4, '2026-01-01 18:27:41'),
(1, '2026-01-07 09:01:44'),
(3, '2026-01-07 09:12:30'),
(2, '2026-01-08 09:25:18');
select e.name, l.login_datetime from Employees e join Logins l on e.emp_id=l.emp_id where current_date - Date(l.login_datetime)<7 order by l.login_datetime;
use training;

--  Display employees who never logged in
-- Actual Tables
-- Employees
-- | emp_id | name |
-- Logins
-- | emp_id | login_datetime |
-- Requirement
-- Display employees who do not have any login records.
-- Use appropriate joins and date conditions.
-- Output Table
-- | name |

select e.name From Employees e where e.emp_id not in (select e.emp_id from Employees e join Logins l on l.emp_id=e.emp_id);

--  Display month-wise employee joining count
-- Actual Tables
-- Employees
-- | emp_id | name | join_date |
-- Requirement
-- Display the month and year.
-- Count how many employees joined in each month.
-- Output Table
-- | join_month | employee_count |

-- Create Employees table
drop table Employees;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    join_date DATE
);

-- Insert random recent employees
INSERT INTO Employees (emp_id, name, join_date) VALUES
(1, 'Arjun Kumar', '2024-11-15'),
(2, 'Priya Sharma', '2025-01-03'),
(3, 'Rohan Mehta', '2025-06-21'),
(4, 'Sneha Iyer', '2025-09-10'),
(5, 'Vivek Reddy', '2025-12-05'),
(6, 'Ananya Gupta', '2026-01-02'),
(7, 'Karan Singh', '2025-07-18'),
(8, 'Meera Nair', '2024-12-29');
select monthname(join_date) as Month, count(emp_id) as Number_of_employees from Employees group by monthname(join_date) order by Month;

--  List employees who joined in the last 30 days
-- Actual Tables
-- Employees
-- | emp_id | name | join_date |
-- Requirement
-- Display employees who joined within the last 30 days from today.
-- Use date comparison functions.
-- Output Table
-- | name | join_date |

select name, join_date from Employees where current_date - date(join_date)<=30;

-- Display employees with their tenure in years
-- Actual Tables
-- Employees
-- | emp_id | name | join_date |
-- Requirement
-- Calculate each employee’s tenure in years.
-- Consider the current date for calculation.
-- Output Table
-- | name | tenure_years |

select name, datediff(date_add(join_date, interval 2 year), curdate()) as date_diff from Employees;

-- Display employees who logged in more than once on the same day
-- Actual Tables
-- Logins
-- | emp_id | login_datetime |
-- Requirement
-- Identify employees who logged in multiple times on the same date.
-- Ignore the time part while grouping.
-- Output Table
-- | emp_id | login_date | login_count |

select emp_id, Date(login_datetime) as login_date, count(login_datetime) as login_count from Logins group by emp_id, login_date; -- on a single day 
-- select emp_id, count(login_datetime) as login_count from Logins group by emp_id; --on no of login from creation

-- Display employees who joined before their manager
-- Actual Table
-- Employees
-- | emp_id | name | manager_id | join_date |
-- Requirement
-- Display employees whose joining date is earlier than their manager’s joining date.
-- Perform a self-join using date comparison.
-- Output Table
-- | name | manager_name | join_date |

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    join_date DATE
);

-- Insert random employees with managers and join dates
INSERT INTO Employees (emp_id, name, manager_id, join_date) VALUES
(1, 'Arjun Kumar', NULL, '2024-11-15'),   -- Top-level manager
(2, 'Priya Sharma', 1, '2025-01-03'),
(3, 'Rohan Mehta', 1, '2025-06-21'),
(4, 'Sneha Iyer', 2, '2025-09-10'),
(5, 'Vivek Reddy', 2, '2025-12-05'),
(6, 'Ananya Gupta', 3, '2026-01-02'),
(7, 'Karan Singh', 3, '2025-07-18'),
(8, 'Meera Nair', 4, '2024-10-29'),
(9, 'Rahul Verma', 5, '2025-08-14'),
(10, 'Divya Patel', 6, '2025-12-20');

select e.name, m.name as manager_name, e.join_date from Employees e 
join Employees m on m.emp_id=e.manager_id where datediff(m.join_date, e.join_date)>0;

--  Display employees with their first login date
-- Actual Tables
-- Employees
-- | emp_id | name |
-- Logins
-- | emp_id | login_datetime |
-- Requirement
-- Display all employees.
-- Show the earliest login date for each employee.
-- If no login exists, display NULL.
-- Output Table
-- | name | first_login_date |

select e.name, Date(Min(l.login_datetime)) as first_login_date from Employees e join Logins l on e.emp_id=l.emp_id group by l.emp_id;

-- 1️⃣ Employees with their last login date (include never logged in)
SELECT 
    e.name,
    MAX(l.login_datetime) AS last_login_date
FROM Employees e
LEFT JOIN Logins l
    ON e.emp_id = l.emp_id
GROUP BY e.emp_id, e.name;

-- 2️⃣ Employees with days since they joined
SELECT 
    name,
    DATEDIFF(CURDATE(), join_date) AS days_since_joined
FROM Employees;

-- 3️⃣ Employees who joined in 2024
SELECT 
    name,
    join_date
FROM Employees
WHERE YEAR(join_date) = 2024;

-- 4️⃣ Department-wise latest hire date
SELECT 
    d.dept_name,
    MAX(e.join_date) AS latest_join_date
FROM Departments d
JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- 5️⃣ Employees who logged in within the last 7 days
SELECT DISTINCT
    e.name,
    l.login_datetime
FROM Employees e
JOIN Logins l
    ON e.emp_id = l.emp_id
WHERE l.login_datetime >= NOW() - INTERVAL 7 DAY;

-- 6️⃣ Employees who never logged in
SELECT 
    e.name
FROM Employees e
LEFT JOIN Logins l
    ON e.emp_id = l.emp_id
WHERE l.emp_id IS NULL;

-- 7️⃣ Month-wise employee joining count
SELECT 
    DATE_FORMAT(join_date, '%Y-%m') AS join_month,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY DATE_FORMAT(join_date, '%Y-%m')
ORDER BY join_month;

-- 8️⃣ Employees who joined in the last 30 days
SELECT 
    name,
    join_date
FROM Employees
WHERE join_date >= CURDATE() - INTERVAL 30 DAY;

-- 9️⃣ Employees with their tenure in years
SELECT 
    name,
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS tenure_years
FROM Employees;

-- 🔟 Employees who logged in more than once on the same day
SELECT 
    emp_id,
    DATE(login_datetime) AS login_date,
    COUNT(*) AS login_count
FROM Logins
GROUP BY emp_id, DATE(login_datetime)
HAVING COUNT(*) > 1;

-- 1️⃣1️⃣ Employees who joined before their manager
SELECT 
    e.name,
    m.name AS manager_name,
    e.join_date
FROM Employees e
JOIN Employees m
    ON e.manager_id = m.emp_id
WHERE e.join_date < m.join_date;

-- 1️⃣2️⃣ Employees with their first login date
SELECT 
    e.name,
    MIN(l.login_datetime) AS first_login_date
FROM Employees e
LEFT JOIN Logins l
    ON e.emp_id = l.emp_id
GROUP BY e.emp_id, e.name;