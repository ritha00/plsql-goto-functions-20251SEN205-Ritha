
**Course:** Database Development with PL/SQL (INSY 8311)
**Instructor:** Eric Maniraguha
**Student:** <MUNEZERO  Isimbi Ritha> | **ID:** <20251SEN205>
**Assignment:** Individual Assignment III

## Overview
This project covers PL/SQL GOTO statements, stored functions, exception
handling, and using functions inside SQL queries. It uses two tables,
`DEPARTMENTS` and `EMPLOYEES`, created in Oracle FreeSQL / Live SQL.

## Assumptions
- `salary` is the monthly salary.
- Tax brackets (monthly): 0-60,000 = 0%; 60,001-100,000 = 10%;
  100,001-200,000 = 20%; above 200,000 = 30%.
- Salary review: below 100,000 = 10% raise; 100,000-300,000 = 5% raise;
  above 300,000 = no raise.
- Employee 6 has no department, employee 7 has a salary of 0 and employee 8
  has a future hire date. These rows were set up on purpose to test the
  payroll validator (C1).

## Repository Structure
| Folder | Content |
|---|---|
| `00_setup/` | Table creation and sample data |
| `01_goto/` | Part A: GOTO programs (A1 to A4) |
| `02_functions/` | Part B functions (B1 to B4) and C1 payroll validator |
| `03_tests/` | B5 (functions in SQL) and test scripts |
| `screenshots/` | Output screenshots |
| `docs/` | `REFLECTION.md` |

## How to Run
1. Run `00_setup/create_tables.sql`.
2. Run the functions in `02_functions/` in this order: B1, B2, B3, B4, then C1
   (C1 uses `fn_dept_name` from B4).
3. Run the programs in `01_goto/`.
4. Run the test files in `03_tests/`.
5. Verify the results against the screenshots.

## Screenshots
| File | Shows |
|---|---|
| `A1_output.png` | Number classifier output |
| `A2_output.png` | Salary review with GOTO |
| `A3_error_and_fix.png` | PLS-00375 illegal GOTO error and the fix |
| `A4_output.png` | Salary review without GOTO |
| `B5_select_output.png` | Functions used in a SELECT |
| `C1_output.png` | Payroll validator results |
