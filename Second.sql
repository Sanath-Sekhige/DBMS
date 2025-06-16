CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY,
    EName VARCHAR(25) NOT NULL,
    Job VARCHAR(25) NOT NULL,
    ManagerNo INT,
    Salary DECIMAL(10, 2) NOT NULL
);

ALTER TABLE Employee
ADD COLUMN Commission DECIMAL(10, 2);

INSERT INTO Employee (EmpNo, EName, Job, ManagerNo, Salary, Commission)
VALUES
  (101, 'Alice',   'Manager',   NULL, 75000.00, 5000.00),
  (102, 'Bob',     'Developer', 101,  60000.00, NULL),
  (103, 'Charlie', 'Analyst',   101,  55000.00, 3000.00),
  (104, 'Diana',   'HR',        101,  50000.00, NULL),
  (105, 'Ethan',   'Sales',     101,  45000.00, 2000.00);

SELECT * FROM Employee;

UPDATE Employee
SET Job = 'Analyst'
WHERE EmpNo = 105;

ALTER TABLE Employee CHANGE COLUMN ManagerNo MgrNo INT;

DELETE FROM Employee
WHERE EmpNo = 105;
