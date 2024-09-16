16 September 2024

## 3 Programming Constructs

1. Sequential - executes step by step
2. Repetition - repeat execution of statement until an end condition occurs
3. Selection - conditional (if/while/etc)

- Freeform compilation uses ``cobc -x -free name.cbl`` which lets us ignore column dependency

- Value clause of a data item - initialisation at compile time

- If 01 var has 05 data items below, then 01 doesn't require a pic clause

- Fillers such as ``05 filler pic x(6)`` are spaceholders

- xDisplayLine is used to display/output the report

- ``perform 100-procedure until condition = true.``

- When using an if statement, an end-if is required to end the statement
