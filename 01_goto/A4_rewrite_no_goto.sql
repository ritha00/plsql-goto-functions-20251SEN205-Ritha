SET SERVEROUTPUT ON

DECLARE
    CURSOR c_emp IS
        SELECT emp_id, first_name, salary
        FROM employees
        WHERE salary > 0
        ORDER BY emp_id;

    v_emp_id     employees.emp_id%TYPE;
    v_first_name employees.first_name%TYPE;
    v_salary     employees.salary%TYPE;
    v_new_salary NUMBER;
    v_note       VARCHAR2(30);
BEGIN
    OPEN c_emp;

    LOOP
        FETCH c_emp INTO v_emp_id, v_first_name, v_salary;
        EXIT WHEN c_emp%NOTFOUND;

        IF v_salary < 100000 THEN
            v_new_salary := v_salary * 1.10;
            v_note := '10% raise';
        ELSIF v_salary <= 300000 THEN
            v_new_salary := v_salary * 1.05;
            v_note := '5% raise';
        ELSE
            v_new_salary := v_salary;
            v_note := 'no raise';
        END IF;

        DBMS_OUTPUT.PUT_LINE(v_emp_id || ' ' || v_first_name ||
                             ': ' || v_salary || ' -> ' || v_new_salary || ' (' || v_note || ')');
    END LOOP;

    CLOSE c_emp;
END;
/