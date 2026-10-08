SET SERVEROUTPUT ON

-- PART 1: ILLEGAL GOTO (jumping INTO an IF block)
BEGIN
    GOTO inside_if;                 -- ILLEGAL

    IF 1 = 1 THEN
        <<inside_if>>
        DBMS_OUTPUT.PUT_LINE('Reached the label inside IF');
    END IF;
END;
/

-- PART 2: FIX (label moved outside the IF, same level as the GOTO)
BEGIN
    GOTO outside_if;                -- LEGAL

    IF 1 = 1 THEN
        DBMS_OUTPUT.PUT_LINE('This line is skipped');
    END IF;

    <<outside_if>>
    DBMS_OUTPUT.PUT_LINE('The error is fixes since it is outside the if');
END;
/