CREATE OR REPLACE FUNCTION fn_validate_payroll (p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
    v_emp    employees%ROWTYPE;
    v_result VARCHAR2(200) := 'VALID';
BEGIN
    SELECT * INTO v_emp
    FROM employees
    WHERE emp_id = p_emp_id;

    -- Check 1: salary
    IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
        v_result := 'INVALID: salary must be greater than zero';
        GOTO done;
    END IF;

    -- Check 2: hire date
    IF v_emp.hire_date IS NULL OR v_emp.hire_date > SYSDATE THEN
        v_result := 'INVALID: hire date is missing or in the future';
        GOTO done;
    END IF;

    -- Check 3: department
    IF fn_dept_name(v_emp.dept_id) = 'Unknown' THEN
        v_result := 'INVALID: employee has no valid department';
        GOTO done;
    END IF;

    <<done>>
    RETURN v_result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: employee not found';
    WHEN OTHERS THEN
        RETURN 'INVALID: unexpected error - ' || SQLERRM;
END fn_validate_payroll;
/