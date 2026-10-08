CREATE OR REPLACE FUNCTION fn_calculate_tax (p_salary IN NUMBER)
RETURN NUMBER
IS
    v_tax NUMBER := 0;
BEGIN
    IF p_salary IS NULL THEN
        RETURN NULL;
    END IF;

    IF p_salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Salary cannot be negative');
    END IF;

    IF p_salary > 200000 THEN
        v_tax := (p_salary - 200000) * 0.30 + 20000 + 4000;
    ELSIF p_salary > 100000 THEN
        v_tax := (p_salary - 100000) * 0.20 + 4000;
    ELSIF p_salary > 60000 THEN
        v_tax := (p_salary - 60000) * 0.10;
    END IF;

    RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/