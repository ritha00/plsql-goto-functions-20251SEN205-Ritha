CREATE TABLE departments (
    dept_id    NUMBER(4)     PRIMARY KEY,
    dept_name  VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
    emp_id      NUMBER(6)     PRIMARY KEY,
    first_name  VARCHAR2(30)  NOT NULL,
    last_name   VARCHAR2(30)  NOT NULL,
    salary      NUMBER(10,2),
    hire_date   DATE,
    dept_id     NUMBER(4)     REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (1, 'Finance');
INSERT INTO departments VALUES (2, 'Medecine');
INSERT INTO departments VALUES (3, 'Pharmacie');

INSERT INTO employees VALUES (1, 'Kuzwa' ,450000, DATE '2015-03-01', 1);
INSERT INTO employees VALUES (2, 'Uwacu' ,280000, DATE '2018-07-15', 2);
INSERT INTO employees VALUES (3, 'Cyiza' ,120000, DATE '2021-01-10', 3);
INSERT INTO employees VALUES (4, 'Rukundo' ,75000, DATE '2023-05-20', 2);
INSERT INTO employees VALUES (5, 'Uwibambe' ,55000, DATE '2024-09-01', 1);
INSERT INTO employees VALUES (6, 'Kamali' ,90000, DATE '2020-02-14', NULL);
INSERT INTO employees VALUES (7, 'Umutoni', 20000, DATE '2022-06-01', 3);
INSERT INTO employees VALUES (8, 'Cyiza', 150000, DATE '2020-04-12',1); 
COMMIT;