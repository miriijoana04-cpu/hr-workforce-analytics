
CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

CREATE TABLE departments (
    dept_id     INT PRIMARY KEY AUTO_INCREMENT,
    dept_name   VARCHAR(100) NOT NULL,
    location    VARCHAR(100)
);

CREATE TABLE employees (
    emp_id             INT PRIMARY KEY AUTO_INCREMENT,
    first_name         VARCHAR(50),
    last_name          VARCHAR(50),
    dept_id            INT,
    hire_date          DATE,
    termination_date   DATE,
    status             VARCHAR(20) DEFAULT 'active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    salary_id        INT PRIMARY KEY AUTO_INCREMENT,
    emp_id           INT,
    amount           DECIMAL(10,2),
    effective_date   DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE attendance (
    attendance_id   INT PRIMARY KEY AUTO_INCREMENT,
    emp_id          INT,
    date            DATE,
    status          VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


INSERT INTO departments (dept_name, location) VALUES
('Human Resources', 'Tirana'),
('Finance', 'Tirana'),
('Technology', 'Tirana'),
('Sales', 'Durres'),
('Operations', 'Tirana');

INSERT INTO employees 
    (first_name, last_name, dept_id, hire_date, termination_date, status) 
VALUES
-- HR Department
('Ana',     'Koci',    1, '2023-01-15', NULL,         'active'),
('Blendi',  'Hoxha',   1, '2023-03-01', '2024-04-30', 'terminated'),
('Mirela',  'Basha',   1, '2022-06-01', NULL,         'active'),
-- Finance
('Erjon',   'Duka',    2, '2022-01-10', NULL,         'active'),
('Teuta',   'Leka',    2, '2023-07-01', '2024-07-31', 'terminated'),
('Arben',   'Mema',    2, '2021-05-15', NULL,         'active'),
('Silvana', 'Gjoni',   2, '2023-09-01', NULL,         'active'),
-- Technology
('Dario',   'Pali',    3, '2022-03-01', NULL,         'active'),
('Klea',    'Sefa',    3, '2023-01-15', NULL,         'active'),
('Andi',    'Zoto',    3, '2022-11-01', '2024-01-31', 'terminated'),
('Nora',    'Ceka',    3, '2021-08-01', NULL,         'active'),
('Gent',    'Rama',    3, '2023-06-01', NULL,         'active'),
-- Sales
('Elsa',    'Vora',    4, '2023-02-01', '2024-10-31', 'terminated'),
('Marko',   'Fili',    4, '2022-09-01', NULL,         'active'),
('Rina',    'Suli',    4, '2024-01-01', NULL,         'active'),
-- Operations
('Besnik',  'Tafa',    5, '2021-03-01', NULL,         'active'),
('Lora',    'Mici',    5, '2023-04-01', '2024-06-30', 'terminated'),
('Ardit',   'Gjoka',   5, '2022-07-01', NULL,         'active');

INSERT INTO salaries (emp_id, amount, effective_date) VALUES
(1,  75000, '2023-01-15'),
(2,  68000, '2023-03-01'),
(3,  82000, '2022-06-01'),
(4,  90000, '2022-01-10'),
(5,  78000, '2023-07-01'),
(6,  95000, '2021-05-15'),
(7,  72000, '2023-09-01'),
(8, 110000, '2022-03-01'),
(9,  98000, '2023-01-15'),
(10, 105000, '2022-11-01'),
(11, 115000, '2021-08-01'),
(12,  92000, '2023-06-01'),
(13,  65000, '2023-02-01'),
(14,  70000, '2022-09-01'),
(15,  67000, '2024-01-01'),
(16,  80000, '2021-03-01'),
(17,  74000, '2023-04-01'),
(18,  77000, '2022-07-01');

INSERT INTO attendance (emp_id, date, status) VALUES
(1, '2024-11-01', 'present'), (1, '2024-11-04', 'present'),
(1, '2024-11-05', 'absent'),  (1, '2024-11-06', 'present'),
(2, '2024-11-01', 'present'), (2, '2024-11-04', 'leave'),
(3, '2024-11-01', 'present'), (3, '2024-11-04', 'present'),
(4, '2024-11-01', 'present'), (4, '2024-11-04', 'present'),
(5, '2024-11-01', 'absent'),  (5, '2024-11-04', 'present'),
(8, '2024-11-01', 'present'), (8, '2024-11-04', 'present'),
(9, '2024-11-01', 'present'), (9, '2024-11-05', 'absent');

