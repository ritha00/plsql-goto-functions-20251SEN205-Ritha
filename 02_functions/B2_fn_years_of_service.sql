CREATE OR REPLACE FUNCTION fn_years_of_service (p_emp_id IN NUMBER)
RETURN NUMBER
IS
    v_hire_date employees.hire_date%TYPE;
BEGIN
    SELECT hire_date INTO v_hire_date
    FROM employees
    WHERE emp_id = p_emp_id;

    IF v_hire_date IS NULL OR v_hire_date > SYSDATE THEN
        RETURN NULL;
    END IF;

    RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, v_hire_date) / 12);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END fn_years_of_service;
/