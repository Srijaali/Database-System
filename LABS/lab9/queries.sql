-- 1
CREATE OR REPLACE TRIGGER trg_students_uppercase
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    :NEW.student_name := UPPER(:NEW.student_name);
END;
/
--2
CREATE OR REPLACE TRIGGER trg_no_delete_weekend
BEFORE DELETE ON employees
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') IN ('SAT','SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Deletion is not allowed on weekends.');
    END IF;
END;
/
-- 3
CREATE TABLE log_salary_audit (
    employee_id   NUMBER,
    old_salary    NUMBER,
    new_salary    NUMBER,
    changed_by    VARCHAR2(30),
    changed_date  DATE
);
CREATE OR REPLACE TRIGGER trg_log_salary_updates
AFTER UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO log_salary_audit
    VALUES (
        :OLD.employee_id,
        :OLD.salary,
        :NEW.salary,
        USER,
        SYSDATE
    );
END;
/

--4
CREATE OR REPLACE TRIGGER trg_price_validate
BEFORE UPDATE OF price ON products
FOR EACH ROW
BEGIN
    IF :NEW.price < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Price cannot be negative.');
    END IF;
END;
/
-- 5
CREATE TABLE courses_audit (
    username   VARCHAR2(30),
    log_time   DATE
);
CREATE OR REPLACE TRIGGER trg_courses_insert_log
AFTER INSERT ON courses
FOR EACH ROW
BEGIN
    INSERT INTO courses_audit
    VALUES (USER, SYSDATE);
END;
/
-- 6
CREATE OR REPLACE TRIGGER trg_default_dept
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
    IF :NEW.department_id IS NULL THEN
        :NEW.department_id := 10; -- default value
    END IF;
END;
/
-- 7
CREATE OR REPLACE TRIGGER trg_sales_totals
FOR INSERT ON sales
COMPOUND TRIGGER

    v_before_total NUMBER;
    v_after_total  NUMBER;

    BEFORE STATEMENT IS
    BEGIN
        SELECT NVL(SUM(amount),0)
        INTO v_before_total
        FROM sales;
    END BEFORE STATEMENT;

    AFTER STATEMENT IS
    BEGIN
        SELECT NVL(SUM(amount),0)
        INTO v_after_total
        FROM sales;

        DBMS_OUTPUT.PUT_LINE('Total before insert: ' || v_before_total);
        DBMS_OUTPUT.PUT_LINE('Total after insert:  ' || v_after_total);
    END AFTER STATEMENT;

END trg_sales_totals;
/
-- 8
CREATE TABLE schema_ddl_log (
    username    VARCHAR2(30),
    event_type  VARCHAR2(20),
    object_name VARCHAR2(30),
    event_time  DATE
);
CREATE OR REPLACE TRIGGER trg_ddl_audit
AFTER CREATE OR DROP ON SCHEMA
BEGIN
    INSERT INTO schema_ddl_log
    VALUES (
        USER,
        ORA_SYSEVENT,
        ORA_DICT_OBJ_NAME,
        SYSDATE
    );
END;
/
-- 9
CREATE OR REPLACE TRIGGER trg_no_update_shipped
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
    IF :OLD.order_status = 'SHIPPED' THEN
        RAISE_APPLICATION_ERROR(-20003, 'Cannot modify shipped orders.');
    END IF;
END;
/
-- 10
CREATE TABLE login_audit (
    username    VARCHAR2(30),
    login_time  DATE
);
CREATE OR REPLACE TRIGGER trg_logon_audit
AFTER LOGON ON SCHEMA
BEGIN
    INSERT INTO login_audit
    VALUES (USER, SYSDATE);
END;
/

