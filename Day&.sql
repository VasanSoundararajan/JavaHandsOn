-- 1️⃣ List all employees with their department name (include employees without department)
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | name | dept_name |

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Charlie Brown', 3),
(104, 'Diana Prince', 3),
(105, 'Ethan Hunt', 4),
(106, 'Fiona Gallagher', 5),
(107, 'George Miller', 2),
(108, 'Hannah Davis', 1),
(109, 'Ian Wright', 4);
INSERT INTO Employees (emp_id, name) Values
(110, 'Julia Roberts');
select e.name, d.dept_name from employees e full join departments d on e.dept_id = d.dept_id;

-- ️⃣ List only employees who have a department

-- Employees
-- | emp_id | name | dept_id |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | name | dept_name |

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Charlie Brown', 3),
(104, 'Diana Prince', 3),
(105, 'Ethan Hunt', 4),
(106, 'Fiona Gallagher', 5),
(107, 'George Miller', 2),
(108, 'Hannah Davis', 1),
(109, 'Ian Wright', 4);
INSERT INTO Employees (emp_id, name) Values
(110, 'Julia Roberts');
select e.name, d.dept_name from employees e join departments d on e.dept_id = d.dept_id;

-- List employees with their salary and department name
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id | salary |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | name | salary | dept_name |

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(101, 'Alice Johnson', 1, 10000),
(102, 'Bob Smith', 2, 12000),
(103, 'Charlie Brown', 3, 5000),
(104, 'Diana Prince', 3, 8000),
(105, 'Ethan Hunt', 4, 6000),
(106, 'Fiona Gallagher', 5, 20000),
(107, 'George Miller', 2, NULL),
(108, 'Hannah Davis', 1, 30000),
(109, 'Ian Wright', 4, NULL);
INSERT INTO Employees (emp_id, name, salary) Values
(110, 'Julia Roberts', 10000);
select e.name, e.salary, d.dept_name from employees e join departments d on e.dept_id = d.dept_id;

-- List all departments with total salary of employees
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id | salary |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | dept_name | total_salary | 

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(101, 'Alice Johnson', 1, 10000),
(102, 'Bob Smith', 2, 12000),
(103, 'Charlie Brown', 3, 5000),
(104, 'Diana Prince', 3, 8000),
(105, 'Ethan Hunt', 4, 6000),
(106, 'Fiona Gallagher', 5, 20000),
(107, 'George Miller', 2, NULL),
(108, 'Hannah Davis', 1, 30000),
(109, 'Ian Wright', 4, NULL);
INSERT INTO Employees (emp_id, name, salary) Values
(110, 'Julia Roberts', 10000);
select d.dept_name, sum(e.salary) as total_salary from employees e join Departments d on e.dept_id = d.dept_id group by d.dept_name;

-- List employees who earn more than the average salary in their department
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id | salary |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | name | dept_name | salary |
-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(101, 'Alice Johnson', 1, 10000),
(102, 'Bob Smith', 2, 12000),
(103, 'Charlie Brown', 3, 5000),
(104, 'Diana Prince', 3, 8000),
(105, 'Ethan Hunt', 4, 6000),
(106, 'Fiona Gallagher', 5, 20000),
(107, 'George Miller', 2, NULL),
(108, 'Hannah Davis', 1, 30000),
(109, 'Ian Wright', 4, NULL);
INSERT INTO Employees (emp_id, name, salary) Values
(110, 'Julia Roberts', 10000);
select e.name, d.dept_name, e.salary from employees e join Departments d on e.dept_id = d.dept_id 
where e.salary > (select Avg(salary) from Employees where e.dept_id = dept_id group by dept_id);

-- 6) List employees who share the same manager
-- Actual Tables

-- Employees
-- | emp_id | name | manager_id |

-- Output Table

-- | name | colleague_name | manager_id |

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int,
    mngr_id  int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary, mngr_id) VALUES
(101, 'Alice Johnson', 1, 10000, 106),
(102, 'Bob Smith', 2, 12000, 108),
(103, 'Charlie Brown', 3, 5000, 108),
(104, 'Diana Prince', 3, 8000, 106),
(105, 'Ethan Hunt', 4, 6000, 110),
(106, 'Fiona Gallagher', 5, 20000, NULL),
(107, 'George Miller', 2, NULL,110),
(108, 'Hannah Davis', 1, 30000, NULL),
(109, 'Ian Wright', 4, NULL, null);
INSERT INTO Employees (emp_id, name, salary, mngr_id) Values
(110, 'Julia Roberts', 10000, NULL);
select distinct LEAST(e.name, e2.name) as name, GREATEST(e.name, e2.name) as colleague_name, e.mngr_id from Employees e 
join Employees e2 on e.mngr_id=e2.mngr_id where e.mngr_id is not null and e.emp_id != e2.emp_id;

-- Count number of employees in each department who earn more than 5000
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id | salary |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | dept_name | num_employees |

-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int,
    mngr_id  int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary, mngr_id) VALUES
(101, 'Alice Johnson', 1, 10000, 106),
(102, 'Bob Smith', 2, 12000, 108),
(103, 'Charlie Brown', 3, 5000, 108),
(104, 'Diana Prince', 3, 8000, 106),
(105, 'Ethan Hunt', 4, 6000, 110),
(106, 'Fiona Gallagher', 5, 20000, NULL),
(107, 'George Miller', 2, NULL,110),
(108, 'Hannah Davis', 1, 30000, NULL),
(109, 'Ian Wright', 4, NULL, null);
INSERT INTO Employees (emp_id, name, salary, mngr_id) Values
(110, 'Julia Roberts', 10000, NULL);

select d.dept_name, Count(e.emp_id) from Employees e join Departments d on e.dept_id=d.dept_id group by d.dept_name;

-- 8) List projects and the number of employees assigned
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id |

-- Projects
-- | project_id | project_name | emp_id |

-- Output Table

-- | project_name | num_employees |

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT
);

-- Create Projects table
CREATE TABLE Projects (
    project_id    INT PRIMARY KEY,
    project_name  VARCHAR(100) NOT NULL,
    emp_id        INT
);
-- Insert Employees
INSERT INTO Employees (emp_id, name, dept_id) VALUES
(101, 'Alice Johnson', 1),
(102, 'Bob Smith', 2),
(103, 'Charlie Brown', 3),
(104, 'Diana Prince', 3),
(105, 'Ethan Hunt', 2);

-- Insert Projects
INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(201, 'Payroll System', 101),
(202, 'Budget Analysis', 102),
(203, 'AI Platform', 103),
(204, 'Mobile App', 104),
(205, 'Marketing Dashboard', 105),
(206, 'Cloud Migration', 103);
select p.project_name, count(p.emp_id) from projects p join Employees e on e.emp_id=p.emp_id GROUP BY p.project_id, p.project_name;

-- List departments with average salary
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id | salary |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | dept_name | avg_salary |


-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int,
    mngr_id  int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary, mngr_id) VALUES
(101, 'Alice Johnson', 1, 10000, 106),
(102, 'Bob Smith', 2, 12000, 108),
(103, 'Charlie Brown', 3, 5000, 108),
(104, 'Diana Prince', 3, 8000, 106),
(105, 'Ethan Hunt', 4, 6000, 110),
(106, 'Fiona Gallagher', 5, 20000, NULL),
(107, 'George Miller', 2, NULL,110),
(108, 'Hannah Davis', 1, 30000, NULL),
(109, 'Ian Wright', 4, NULL, null);
INSERT INTO Employees (emp_id, name, salary, mngr_id) Values
(110, 'Julia Roberts', 10000, NULL);

select d.dept_name, avg(e.salary) from Employees e join Departments d on e.dept_id = d.dept_id group by d.dept_name;

-- List employees who work in HR or IT
-- Actual Tables

-- Employees
-- | emp_id | name | dept_id |

-- Departments
-- | dept_id | dept_name |

-- Output Table

-- | name | dept_name |


-- Create Departments table
CREATE TABLE Departments (
    dept_id   INT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(100) NOT NULL,
    dept_id  INT,
    salary   Int,
    mngr_id  int
);
-- Insert values into Departments
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert values into Employees
INSERT INTO Employees (emp_id, name, dept_id, salary, mngr_id) VALUES
(101, 'Alice Johnson', 1, 10000, 106),
(102, 'Bob Smith', 2, 12000, 108),
(103, 'Charlie Brown', 3, 5000, 108),
(104, 'Diana Prince', 3, 8000, 106),
(105, 'Ethan Hunt', 4, 6000, 110),
(106, 'Fiona Gallagher', 5, 20000, NULL),
(107, 'George Miller', 2, NULL,110),
(108, 'Hannah Davis', 1, 30000, NULL),
(109, 'Ian Wright', 4, NULL, null);
INSERT INTO Employees (emp_id, name, salary, mngr_id) Values
(110, 'Julia Roberts', 10000, NULL);

select e.name, d.dept_name from Employees e join Departments d on e.dept_id = d.dept_id where e.dept_id=1 or e.dept_id=3;