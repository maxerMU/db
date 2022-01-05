CREATE table IF NOT EXISTS employee (
    pk int,
    fk_departament int,
    post text,
    full_name text,
    salary int
);

CREATE table IF NOT EXISTS departament (
    pk int,
    name text,
    phone_number text,
    fk_manager int
);

CREATE table IF NOT EXISTS medicament (
    pk int,
    name text,
    instruction text,
    cost int
);

CREATE table IF NOT EXISTS emp_med (
    fk_employee int,
    fk_medicament int
);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(0, 0, 'qwer', 'maax fadsf fas', 100);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(1, 0, 'qweajdsgkl', 'dafx fadsf fas', 1000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(2, 0, 'qdsafweajdsgkl', 'dafx fadsf fas', 2000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(3, 5, 'qdsafweajdsgkl', 'dx fsf fas', 2000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(4, 6, 'qdsal', 'dx fsf fas', 2000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(5, 2, 'qds fal', 'dx fsf fas', 3000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(6, 1, 'qds fal', 'dx fsf fas', 3000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(7, 4, 'qdssdaflfal', 'dx fsf faafdass', 4000);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(8, 8, 'qdlllssdaflfal', 'dx fsf fass', 6700);

INSERT INTO employee(pk, fk_departament, post, full_name, salary) VALUES
(9, 1, 'qdlfal', 'dx fsf fss', 6700);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(0, 'tyu', '845215641', 0);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(1, 'tyua', '845219841', 1);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(2, 'tfyua', '827819841', 3);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(3, 'tfyuaa', '827818461', 2);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(4, 'tyuaa', '821846771', 4);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(5, 'tuoiuytra', '821679171', 5);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(6, 'tuoiua', '812379171', 6);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(7, 'tuoiagua', '81237671', 7);

INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(8, 'tuoiaa', '8123767761', 8);
INSERT INTO departament(pk, name, phone_number, fk_manager) VALUES
(9, 'tuoiaaa', '8123741767', 9);

INSERT INTO medicament(pk, name, instruction, cost) VALUES
(0, 'qewr', 'rjqwl qwrj qweljr qwljr', 1324);

INSERT INTO medicament(pk, name, instruction, cost) VALUES
(1, 'qew4r', 'rjqwl qwrj qweljqwljr', 13254);

INSERT INTO medicament(pk, name, instruction, cost) VALUES
(2, 'qafdew4r', 'rj qwl qwrj qweljqwljr', 132);

INSERT INTO medicament(pk, name, instruction, cost) VALUES
(3, 'qafw4r', 'rj qwl qwrj qweljqwr', 13278);

INSERT INTO medicament(pk, name, instruction, cost) VALUES
(4, 'qafw4r543263', 'rj qwl qwrj qadskljfk;lasjdf;klajwfk;weljqwr', 1327778);

INSERT INTO emp_med(fk_employee, fk_medicament) VALUES
(0, 0);

INSERT INTO emp_med(fk_employee, fk_medicament) VALUES
(1, 2);

INSERT INTO emp_med(fk_employee, fk_medicament) VALUES
(3, 4);

INSERT INTO emp_med(fk_employee, fk_medicament) VALUES
(2, 2);

INSERT INTO emp_med(fk_employee, fk_medicament) VALUES
(3, 1);

-- case
SELECT full_name,
CASE
    WHEN salary >= 3000 THEN 'rich'
    ELSE 'poor'
END status
FROM employee;

-- WINDOW
SELECT full_name, fk_departament, SUM(SALARY) OVER (PARTITION by fk_departament) as dep_sal_sum
FROM employee;

SELECT fk_departament
FROM employee
GROUP by fk_departament
HAVING sum(salary) > 3000;

CREATE OR replace PROCEDURE get_index_inf(table_name text)
AS $$
DECLARE
    num_cols int;
BEGIN
    SELECT indnatts INTO num_cols
    FROM pg_index i JOIN pg_class c on i.indrelid = c.oid
    WHERE relname=table_name;

    RAISE notice 'num cols: %', num_cols;
END;
$$
LANGUAGE plpgsql;

CALL get_index_inf('employee');