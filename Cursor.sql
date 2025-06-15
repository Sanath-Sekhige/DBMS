CREATE TABLE EMP (
    Emp_ID INT,
    Emp_Name VARCHAR(25),
    Age INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO EMP VALUES (100, 'jhon', 26, 50000), (105, 'Eva', 28, 65000);

DELIMITER $$

CREATE PROCEDURE FetchEmp()
BEGIN
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(25);
    DECLARE v_age INT;
    DECLARE v_salary DECIMAL(10, 2);
    DECLARE finished INT DEFAULT FALSE;

    DECLARE emp_cursor CURSOR FOR 
        SELECT Emp_ID, Emp_Name, Age, Salary FROM EMP;

    DECLARE CONTINUE HANDLER FOR NOT FOUND 
        SET finished = TRUE;

    OPEN emp_cursor;

    emp_loop: LOOP
        FETCH emp_cursor INTO v_id, v_name, v_age, v_salary;

        IF finished THEN
            LEAVE emp_loop;
        END IF;

        SELECT v_id AS ID, v_name AS Name, v_age AS Age, v_salary AS Salary;
    END LOOP;

    CLOSE emp_cursor;
END$$

DELIMITER ;

CALL FetchEmp();