CREATE TABLE Customer (
    CID INT PRIMARY KEY,
    CName VARCHAR(25),
    Age INT,
    Address VARCHAR(25),
    Salary DECIMAL(10, 2)
);

CREATE TABLE SalaryLog (
    CustomerID INT,
    OperationType VARCHAR(20),
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    SalaryDifference DECIMAL(10, 2)
);

DELIMITER $$
CREATE TRIGGER trg_salary_insert
AFTER INSERT ON Customer
FOR EACH ROW
BEGIN
    INSERT INTO SalaryLog (CustomerID, OperationType, OldSalary, NewSalary, SalaryDifference)
    VALUES (NEW.CID, 'INSERT', NULL, NEW.Salary, NULL);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_salary_update
AFTER UPDATE ON Customer
FOR EACH ROW
BEGIN
	INSERT INTO SalaryLog (CustomerID, OperationType, OldSalary, NewSalary, SalaryDifference)
	VALUES (NEW.CID, 'UPDATE', OLD.Salary, NEW.Salary, NEW.Salary - OLD.Salary);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_salary_delete
AFTER DELETE ON Customer
FOR EACH ROW
BEGIN
    INSERT INTO SalaryLog (CustomerID, OperationType, OldSalary, NewSalary, SalaryDifference)
    VALUES (OLD.CID, 'DELETE', OLD.Salary, NULL, NULL);
END $$
DELIMITER ;

select * from Customer;
select * from SalaryLog;

INSERT INTO Customer VALUES (100, 'John', 24, 'Chennai', 50000.00);

UPDATE Customer
SET Salary = 55000.00
WHERE CID = 100;

DELETE FROM Customer
WHERE CID = 100;
