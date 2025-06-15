CREATE TABLE Employee (
    EmpNo INT,
    EName VARCHAR(25),
    Job VARCHAR(25),
    ManagerNo INT,
    Salary DECIMAL(10, 2),
    Commission DECIMAL(10, 2)
);

CREATE USER 'employee_user' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON Employee TO 'employee_user';

START TRANSACTION;
INSERT INTO Employee (EmpNo, EName, Job, ManagerNo, Salary, Commission) VALUES
    (101, 'John Smith', 'Manager', NULL, 75000.00, 5000.00),
    (102, 'Alice Brown', 'Developer', 101, 65000.00, NULL),
    (103, 'Bob Martin', 'Analyst', 101, 62000.00, 2500.00),
    (105, 'David Lee', 'Developer', 101, 66000.00, 1500.00);

SELECT * FROM Employee;
ROLLBACK;
SELECT * FROM Employee;

ALTER TABLE Employee ADD CONSTRAINT PRIMARY KEY (EmpNo);
ALTER TABLE Employee MODIFY EName VARCHAR(25) NOT NULL;
ALTER TABLE Employee MODIFY Job VARCHAR(25) NOT NULL;
ALTER TABLE Employee MODIFY Salary DECIMAL(10, 2) NOT NULL;

DESC Employee;
SELECT * FROM Employee;

INSERT INTO Employee VALUES (104, 'Honda Goro', NULL, 101, 68000, NULL);
