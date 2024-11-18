# Assignment 3

- Write a COBOL program which will read the data from the input file States.txt.
- Display output to the screen and generate a report into an output file named States-01-output.txt.

Generally, the procedure should:

- Initialization: Perform any one-time activities that are necessary prior to your data processing.
-    Processing: Perform your processing paragraph until an end-of-file flag data item is Y (be sure to initialize that data item to N, either with the value clause or in your initialization paragraph). This will require a repetition statement (a Perform/Until statement).
 -   Termination: Perform any one-time activities that are necessary after your last inventory item.
  -  Stop the execution of your program.


### States.txt consists of

state number         2 digits

state abbreviation   2 characters

region code          1 character

state name           20 characters

population           8 digits

area                       6 digits


### Input file needs:
- Select statement
- fd entry
- Associated record description

### General Structure

#### Your initialization paragraph should:
- Open your input file for input and display headings

#### Your processing paragraph should: 
- Attempt to read the next record in the file. If you successfully read a record, perform a second processing paragraph. If, on the other hand, you get an end-of-file condition, move Y to your end-of-file flag data item.

#### Your second processing paragraph should process the record that you just read:

   - Move input fields into appropriate output fields.
   - Calculate the population density (population divided by area).
   - Display an output detail record.
   - Increment a count of the number of states that you process.
   - Accumulate the total population.
   - Accumulate the total area.

#### Your termination paragraph should:
- Display a footing line that shows the count of the number of states processed, the total population, the total area, and the overall weighted population density (total population divided by total area).



#### Once your program is working, and your output is correct, modify your program to also generate output into an output file. 

- You will need three things for your output file:

   1. a Select statement that binds your desired internal file name to the external file name (States-01-output.txt)
   2. an fd entry
   3. an associated record; your associated record for output will typically be a single alphanumeric item; make sure it is as big as the biggest line of output that you will want to generate

 

- You will need one additional step in your initialization paragraph:

   1. After you open your input file, open your output file for output

 

- You will need one additional step in your second processing paragraph:

   1. After you display a detail record, write that same detail record into your output file.

 

- You will need two additional steps in your termination paragraph:
  1. After you display your footing line, write that same footing line into your output file.
   2.  Close your output file.
