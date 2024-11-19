# Assignment 5 - Capital Table

Write a COBOL program which will read the data from the input file Capitals.txt, store that data in a table, and display an interactive, searchable report to the screen

Data format

```01  xCapitalTable.

    05  xCapitalElement occurs 50 times.

        10  xStateAbbr          pic x(2).

        10  xCapitalName     pic x(14).

        10  nPopulation         pic 9(7).

        10  nFoundYear        pic 9(4).

        10  nPopRank          pic 9(2).
```

 
Read all of the data from Capitals.txt, storing fields from each record as the next element in your table.  Your program should consist of three broad steps, then stop:

  - Initialization: Perform any one-time activities that are necessary prior to your data processing. (In this program, one-time activities include opening & reading the entire file and storing the data from that file in your table. After you have done these one-time steps, you are ready to process the elements in the table, in your processing paragraph.)
  -  Processing: Perform your processing paragraph to process the elements in your table. This will require a repetition statement (a Perform/Varying statement is almost always a good way to process the elements in a table).
  -  Termination: Perform any one-time activities that are necessary after your last inventory item.
  -  Stop the execution of your program.

Your initialization paragraph should:

  - Open your input file.
  - (Read the records from the input file, storing them in your table.) Perform a second initialization paragraph until an end-of-file flag data item is Y (be sure to initialize that data item to N, either with the value clause or in your initialization paragraph). This will require a repetition statement (a Perform/Until statement).
  - Close your input file.
  - Display headings.

Your second initialization paragraph should:

  - Attempt to read the next record in the file.
  - -If you successfully read a record, perform a third initialization paragraph, to process the record.
  -  If, on the other hand, you get an end-of-file condition, move Y to your end-of-file flag data item.

Your third initialization paragraph should process the record that you just read:

  - Add 1 to a counter, to be used as your table element number (index).
  - Move input fields into appropriate fields in your table.

Your processing paragraph should:

  - Ask the user to enter a value to search by whatever element field you want.  You can allow them to search by minimum population (as shown above), the population rank within the state, or the year the capital was founded. 
  - Based on whether it fits the search requirement, move an element from your table to your output detail record.
  - Display the output detail record.
  - Increment a count of the number of capitals that you process.

Your termination paragraph should:

  - Display a footing line that shows the count of the number of capitals processed.
