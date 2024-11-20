# Assignment 6 - State Table

- Write a COBOL program which will read the data from the input file States.txt and display a report on the screen.
- Your report should be divided into two parts: states east of the Mississippi River, followed by states west of the Mississippi. 
- (Note: The third character in each record in States.txt is an e or a w, indicating the state's region. The first two characters are the sequential "state number".)

 - Record fields are 2 digit state number, 2 character state abbreviation, 1 character region code, 20 character state name, 8 digit population, 6 digit area

 - Define the record table as:

 ``` 01  xStateTable.
    05  xStateElement occurs 51 times.

        10  xRegionCode         pic x.

        10  xStateName          pic x(20).

        10  nPopulation         pic 9(8).

        10  nArea               pic 9(6).

        10  nDensity            pic 9(4)v99.
```


- You will sort the table on two keys: region code, then state name.

- This assignment exhibits the concept of a control break in a report – when the value of a data item (the control variable) changes, you will generate a control break, such as a blank line and perhaps subtotals – a break in the report. To implement this, define a data item to use as your control variable. This will be a single alphanumeric character. Initialize this variable to spaces.

#### Your program should contain three broad steps, then stop:

-    Initialization: Perform any one-time activities that are necessary prior to your data processing. (In this program, one-time activities include reading the entire file and storing the data from that file in your table. It also includes sorting the table. After you have done these one-time steps, you are ready to process the elements in the table, in your processing paragraph.)
 -   Processing: Perform your processing paragraph to process the elements in your table. This will require a repetition statement (a Perform/Varying statement is almost always a good way to process the elements in a table).
  -  Termination: Perform any one-time activities that are necessary after your last inventory item.
   - Stop the execution of your program.

#### Your initialization paragraph (100-initialization) should:

-    Open your input file.
 -   Read the records from the input file, storing them in your table. Perform a second initialization paragraph (110-read-file) until an end-of-file flag data item is Y (be sure to initialize that data item to N, either with the value clause or in your initialization paragraph). This will require a repetition statement (a Perform/Until statement).
  -  Close your input file.
   - Sort the table, specifying your two sort keys in your Sort statements (Note: see video in Module Week 8).  You will have better luck sorting by state name first, then by region code.
   - Display headings.

#### Your second initialization paragraph (110-read-file) should:

  -  Attempt to read the next record in the file.
  -  If you successfully read a record, perform a third initialization paragraph (120-load-table) to process the record that you just read.
  -  If, on the other hand, you get an end-of-file condition, move Y to your end-of-file flag data item.

#### Your third initialization paragraph (120-load-table) should process the record that you just read:

 -   Add 1 to a counter, to be used as your table element number (nLoadSubscript).
  -  Move input fields from your associated record into appropriate fields in your table element. Remember that referring to a table element requires the use of a subscript (the counter that you incremented in step 1).
   - Calculate the population density (population divided by area), and store that in your table element.

#### Your processing paragraph (200-process) should:

   - Using the control variable from your Perform/Varying statement, see if this is NOT the first element in your table.
   - If this is not the first element, check for a change in the value of regionCode – that is, check for a "control break", which would require subtotals.
   - You should use two consecutive (nested) if statements for this: first, check to see if your subscript variable is greater than 1, then if it is, check to see if the current element's regionCode is not equal to the previous element's regionCode (subscript minus 1). If these if statements are true, perform a control break paragraph.

#### The remaining steps in this paragraph are AFTER your if statements.

  -  Using the control variable from your Perform/Varying statement as your subscript, move fields from your table element into fields in your output detail record.
   - Move fields from the "current" table element into detail output fields – table elements MUST be subscripted.
  -  Display an output detail record (one line of output).
   - Increment a count of the number of states that you process (increment a subtotalCounter).
  -  Accumulate the total population (accumulate a subtotalPopulation).
   - Accumulate the total area (accumulate subtotalArea).

#### Your control break paragraph should:

  - Move your subtotalStateCounter, subtotalPopulation, and subtotalArea into numeric edited output fields.
   - Calculate subtotal population density.
   - Generate subtotal output.
   - Set your subtotalStateCounter, subtotalPopulation, and subtotalArea to zero.

#### Your termination paragraph should:

  -  Call your control break paragraph to generate your final control break.
