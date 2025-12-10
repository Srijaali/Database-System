-- q1
CREATE TABLE bank_accounts (
    account_no   VARCHAR2(10) PRIMARY KEY,
    holder_name  VARCHAR2(50),
    balance      NUMBER
);

INSERT INTO bank_accounts VALUES ('A','Ali',30000);
INSERT INTO bank_accounts VALUES ('B','Bilal',20000);
INSERT INTO bank_accounts VALUES ('C','Sara',25000);

COMMIT;
-- Deduct from A
UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_no = 'A';

-- Credit to B
UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_no = 'B';

-- Mistaken update to C
UPDATE bank_accounts
SET balance = balance - 3000
WHERE account_no = 'C';

-- Undo everything
ROLLBACK;
SELECT * FROM bank_accounts;

-- q2
CREATE TABLE inventory (
    item_id   NUMBER PRIMARY KEY,
    item_name VARCHAR2(50),
    quantity  NUMBER
);

INSERT INTO inventory VALUES (1,'Pen',100);
INSERT INTO inventory VALUES (2,'Book',150);
INSERT INTO inventory VALUES (3,'Marker',80);
INSERT INTO inventory VALUES (4,'Notebook',60);
COMMIT;

UPDATE inventory
SET quantity = quantity - 10
WHERE item_id = 1;

SAVEPOINT sp1;
UPDATE inventory
SET quantity = quantity - 20
WHERE item_id = 2;

SAVEPOINT sp2;
UPDATE inventory
SET quantity = quantity - 5
WHERE item_id = 3;
ROLLBACK TO sp1;
COMMIT;

-- q3
CREATE TABLE fees (
    student_id NUMBER PRIMARY KEY,
    name        VARCHAR2(50),
    amount_paid NUMBER,
    total_fee   NUMBER
);

INSERT INTO fees VALUES (1,'Ayesha',10000,30000);
INSERT INTO fees VALUES (2,'Hassan',15000,30000);
INSERT INTO fees VALUES (3,'Umar',20000,30000);

COMMIT;

UPDATE fees
SET amount_paid = amount_paid + 5000
WHERE student_id = 1;
SAVEPOINT halfway;
UPDATE fees
SET amount_paid = amount_paid + 5000
WHERE student_id = 2;
ROLLBACK TO halfway;
COMMIT;

-- q4
CREATE TABLE products (
    product_id   NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    stock        NUMBER
);

CREATE TABLE orders (
    order_id   NUMBER PRIMARY KEY,
    product_id NUMBER,
    quantity   NUMBER
);
INSERT INTO products VALUES (1,'Laptop',20);
INSERT INTO products VALUES (2,'Keyboard',40);

COMMIT;

UPDATE products
SET stock = stock - 2
WHERE product_id = 1;
INSERT INTO orders VALUES (1,1,2);
DELETE FROM products
WHERE product_id = 2;
ROLLBACK;
UPDATE products
SET stock = stock - 2
WHERE product_id = 1;

INSERT INTO orders VALUES (1,1,2);

COMMIT;

-- q5
CREATE TABLE employees (
    emp_id   NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary   NUMBER
);

INSERT INTO employees VALUES (1,'Ali',30000);
INSERT INTO employees VALUES (2,'Bilal',32000);
INSERT INTO employees VALUES (3,'Fatima',31000);
INSERT INTO employees VALUES (4,'Sara',33000);
INSERT INTO employees VALUES (5,'Umar',34000);

COMMIT;

UPDATE employees
SET salary = salary + 2000
WHERE emp_id = 1;

SAVEPOINT A;
UPDATE employees
SET salary = salary + 2000
WHERE emp_id = 2;

SAVEPOINT B;
UPDATE employees
SET salary = salary + 2000
WHERE emp_id = 3;
ROLLBACK TO A;
COMMIT;
