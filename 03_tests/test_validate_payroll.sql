SET SERVEROUTPUT ON

BEGIN
  FOR k IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('Emp ' || k || ': ' || fn_validate_payroll(k));
  END LOOP;
END;