# Assignment 04

- Write a COBOL program which will read the data from the input files Payroll.transaction.txt and Payroll.master.txt.
- Initially, your program will display output to the screen. 
- After your output looks correct, you will modify your program to also generate a report into an output file named Payroll-01-output.txt.

### Broadly, we have 3 steps:

Your program should consist of three broad steps, then stop:

 - Initialisation: Perform any one-time activities that are necessary prior to your data processing. (For one thing, open your transaction file, but don't open your master file just yet.)

 
-  Processing: Perform your processing paragraph until an end-of-file flag data item is Y (be sure to initialize that data item to N, either with the value clause or in your initialization paragraph). This will require a repetition statement (a Perform/Until statement). This statement is checking for an end-of-file condition on your transaction file.

 

- Termination: Perform any one-time activities that are necessary after your last inventory item. Then stop the program



#### Payroll.transaction.txt consists of records with fixed-length fields:

employee number      4 digits

hours worked         3 digits

 

#### Payroll.master.txt consists of records with fixed-length fields:

department number    1 digit

employee number      4 digits

last name            20 characters

first name           20 characters

pay rate             5 characters total, 999v99

 

#### Your initialization paragraph should:
-    Display headings.
-    Open your transaction file for input.

#### Your processing paragraph should:

 - Attempt to read the next record in the transaction file.
- If you successfully read a record, perform a second processing paragraph.
-  If, on the other hand, you get an end-of-file condition, move Y to your transaction-end-of-file flag data item.

 

#### Your second processing paragraph should process the transaction file record that you just read:

  1.  Initialize an "employee number found" flag to N.
  2.   Initialize a "master-end-of-file" flag to N.
   3. Open the master file.
   4. Perform a third processing paragraph, until the "employee number found" flag is Y or the "master-end-of-file" flag is Y.
   5. Close the master file.
   6. If the "employee number found" flag is "Y", perform a fourth processing paragraph.

 

#### Your third processing paragraph should:
-  Attempt to read the next record in the master file.
-  If, on the other hand, you get an end-of-file condition, move Y to your master-end-of-file flag data item.
-  If you don't get an end-of-file condition, AND if this employee number equals the employee number from the current transaction record, move "Y" to your "employee number found" flag.

 

#### Your fourth processing paragraph should process the master file record that you just read:

-   Process data from the current transaction record and from the current master record.
-   Update accumulators.
-   Display a line of output.

#### Your termination paragraph should:

-  Display a footing line that shows the count of the number of employees processed, the total hours worked, and the total gross pay.

 

Once your program is working, and your output is correct, modify your program to also generate output into an output file.

 
