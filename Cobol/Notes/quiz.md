## Quiz Q&A

1. What is the file extension for COBOL source code? *.cbl*
2. Which of the following is true for our programming assignments? *it is imperative that I do my own work on my homework, because it is the best way to learn, and the best preparation for our exams*
3. The name of the class server? *mislab*
4. THe application to type the source code is? *text editor*
5. What does a compiler do, in a general sense? *converts source code to machine language*
6. The 'B' in COBOL stands for? *Business*
7. How many divisions in ***any** COBOL program? *4*
8. We have to ensure certain parts of COBOL program are in certain parts of the screen due to? *column-dependency*
9. What is Area A? *Cols 8-11*
10. What command compiles our COBOL source code? ``cobc -x file.cbl``
11. Which of the following is NOT a division? *Class*
12. Which division defines variables? *Data*
13. Good naming for a numeric-edited of a GPA? *neGPA*
14. Data items with pic clause of 999v99 is what type? *numeric*
15. Which of the following is not a COBOL data type? *Float*
16. What type of statement receives user input? *accept*
17. Which of the following actually declares a data type? *characters in pic clause*
18. Which of the following detects logic errors in COBOL? *human programmer or end user*
19. Which of the following detects syntax errors in COBOL? *compiler*


## Quiz Q&A 2

1. ``program-id. HelloWorld.`` "program-id" is a... *paragraph*
2.  Which of the following is not a COBOL data type? *Percent*
3.  Which of the following does a pic clause NOT define? - *value*
4.  You can give a variable an initial value by using the ______ clause. *value*
5.  ``perform 200-processing until xEofFlag = 'y'.``Under what conditions will the 200-processing paragraph be executed? *   only when xEofFlag has a value other than 'y'*
6.   Where would we place statements for things we want to occur one time at the beginning of our program?  *initialisation paragraph*
7.    If we want to display a one-time "Good bye" message to our users at the end of a program's execution, where would it be located?  *termination paragraph*
8. An IF statement is an example of a ______ statement.  *conditional*
9. Where do you find a section of code named working-storage? *data division*
10.  You define group data items in the _________ section.  *working-storage*
11.   We refer to data items that keep a running total of a value while a repetition statement is being executed as _____ data items.  *accumulator*
12.    A data item with a level number of 05 is ______ a data item with a level number of 01.  *subordinate to*
13. A _____ statement will copy & paste a value from one data item to another.  *move*
14.  A pic clause of x(25) will _______. *hold 25 alphanumeric characters*
15.   What does it mean if an external file has an organization that is line sequential?  *file is written with 1 record per line*
16.    If you have 100 employees in your organization, how many records would you expect to have in your payroll data file?  *one record per employee*
17.``write xOutput from xOutputHeading before advancing 2 lines.`` What does "before advancing 2 lines" result in? *a blank line will appear in the report between xOutputHeading and the next line to be written*
18. What is the purpose of the value clause when declaring a data item? *assign initial value at compilation time*
19.  Where does the ``accept... date`` statement retrieve the current date value from? *computer operating system*
20.   You need three things for each input or output file that you use. Which of the following is NOT one of those three things?  *read statement*
21.    We have talked about three broad steps that comprise the logic of many programs. Which of the following is NOT one of those broad steps?  *programming*
22. Which statement is used to read a record from a file? *read*
23.  Which statement is used to write a record into a file? *write*
24.   You need three things for each input or output file that you use. Which of the following is NOT one of those three things?  *read, we need fd, select, and AR desc)*
25.  When you read a record from a file, the data from that record will automatically go to: *the associated record description*
26.   The first step in executing a Perform/Until statement is: *check the condition*
27.    If you name a data item xCustomerTable, that makes it a table. *false*
28. A table is created by using the "occurs" clause. *true*
29.  If you want to step through the elements in a table, a common statement to use would be a: *perform/varying statement*
30.  ``perform 210-process varying nSub from 5 by 10 until nSub > 50.`` How many times would you expect to perform 210-process? *5*

## Quiz Q&A 3

1. Which statement is used to read a record from a file? *read*
2. Cobol function used to remove excess spaces from end of value? *function trim*
3. Function of value clause when declaring a data item? *provide the newly created variable with an initial value*
4. What does it mean if an external file has an organisation which is line sequential? *file is written with one record to a line*
5. What will be the value of nSub for first time perform 210-process: ``perform 210-process varying nSub from 5 by 10 until nSub>50? *5*
6. To step through table elements, a common statement to use would be? *Perform/Varying statement*
7. Which statement can use to sort table? *sort*
8. Which of following likely to display when generating a control break? *subtotals*
9. We have used sort to sort what? *table*
10. To step through table elements, a common statement to use would be? *Perform/Varying statement*
