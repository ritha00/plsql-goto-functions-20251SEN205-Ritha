SET SERVEROUTPUT ON

DECLARE
    num NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Number tested: ' || num);

    IF num > 0 THEN
        GOTO positive_number;
    ELSIF num < 0 THEN
        GOTO negative_number;
    ELSE
        GOTO zero_number;
    END IF;

    <<positive_number>>
    DBMS_OUTPUT.PUT_LINE('The number is POSITIVE');
    GOTO check_parity;

    <<negative_number>>
    DBMS_OUTPUT.PUT_LINE('The number is NEGATIVE');
    GOTO check_parity;

    <<zero_number>>
    DBMS_OUTPUT.PUT_LINE('The number is ZERO');
    GOTO end_program;

    <<check_parity>>
    IF MOD(num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is EVEN');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is ODD');
    END IF;

    <<end_program>>
    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/