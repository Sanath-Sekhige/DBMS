CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EName VARCHAR(25) NOT NULL,
    Age INT NOT NULL,
    Salary INT NOT NULL
);

INSERT INTO Employee (EmpID, EName, Age, Salary)
VALUES
    (1, 'Alice', 30, 50000),
    (2, 'Bob', 28, 45000),
    (3, 'Charlie', 35, 55000),
    (4, 'Tim', 32, 50000);

SELECT COUNT(EName) AS TotalEmployees FROM Employee;

SELECT MAX(Age) AS OldestAge FROM Employee;

SELECT MIN(Age) AS YoungestAge FROM Employee;

SELECT EName, Salary FROM Employee ORDER BY Salary ASC;

SELECT Salary, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Salary
ORDER BY Salary ASC;

SELECT AVG(Salary) AS AverageSalary FROM Employee;

SELECT SUM(Salary) AS TotalSalary FROM Employee;