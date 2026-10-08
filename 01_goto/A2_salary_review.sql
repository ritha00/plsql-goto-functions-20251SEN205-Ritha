SET SERVEROUTPUT ON

DECLARE
    v_emp_id     NUMBER := 1;
    v_first_name employees.first_name%TYPE;
    v_salary     employees.salary%TYPE;
    v_new_salary NUMBER;
BEGIN
    SELECT first_name, salary
    INTO   v_first_name, v_salary
    FROM   employees
    WHERE  emp_id = v_emp_id;

    IF v_salary < 100000 THEN
        GOTO low;
    ELSIF v_salary <= 300000 THEN
        GOTO mid;
    ELSE
        GOTO high;
    END IF;

    <<low>>
    v_new_salary := v_salary * 1.10;
    DBMS_OUTPUT.PUT_LINE(v_first_name || ': ' || v_salary || ' -> ' || v_new_salary || ' (10% raise)');
    GOTO end_review;

    <<mid>>
    v_new_salary := v_salary * 1.05;
    DBMS_OUTPUT.PUT_LINE(v_first_name || ': ' || v_salary || ' -> ' || v_new_salary || ' (5% raise)');
    GOTO end_review;

    <<high>>
    DBMS_OUTPUT.PUT_LINE(v_first_name || ': ' || v_salary || ' -> no raise');

    <<end_review>>
    DBMS_OUTPUT.PUT_LINE('Review complete.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/