# Reflection

## 1. What did GOTO let you do, and what problems did it cause?
GOTO let me jump to labelled sections of the program in A1 and A2, for example
jumping to the right salary band. However, the program became harder to read
because the flow jumps around instead of running from top to bottom, and I had
to be careful that every label had a statement after it.

## 2. What did the illegal GOTO (A3) teach you?
I learned that PL/SQL does not allow a GOTO to jump into an IF, a loop or a
nested block. It gave the error PLS-00375. The fix was to move the label to the
same level as the GOTO, or into an enclosing block.

## 3. GOTO version compared with the version without GOTO (A2 and A4)
Both versions give the same results. The IF / ELSIF / ELSE version in A4 is
shorter, easier to read and easier to test, because it runs from top to bottom
with no labels. I would use it in real projects and keep GOTO for rare cases.

## 4. Why are functions useful?
Functions can be reused, return a single value, and can be called inside SQL
queries (B5). This keeps business rules, such as the tax calculation, in one
place instead of repeating them.

## 5. How did you handle errors?
I used the NO_DATA_FOUND exception to return NULL or 'Unknown' when an employee
or department did not exist. In the tax function I raised a custom error
(-20002) for a negative salary. The payroll validator returns a clear message
for each type of invalid data.

## 6. What challenges did you face and what did you learn?
I had several errors while setting up the database: ORA-01031 (insufficient
privileges), ORA-00942 (table does not exist) and ORA-00947 (not enough values
because my INSERT statements did not match the columns). I fixed them by
creating the tables first, checking them with a SELECT, and making each INSERT
match the table columns. I learned to test each script on its own and to check
the first error message, not the last.

## 7. What would you improve?
I would add more validation rules to the payroll function, such as checking
that the department exists in the table and that the salary is within a
reasonable range. I would also use a stored procedure to apply the salary
raises to the table, since my programs only display the new salary.

## 8. AI assistant used
I used Claude, an AI assistant made by Anthropic, while working on this
assignment. I used it to:
- explain the Oracle errors I got (ORA-01031, ORA-00942, ORA-00947, and
  PL/SQL syntax errors) and how to fix them;
- explain how GOTO labels, functions and exception handling work;

