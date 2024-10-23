

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