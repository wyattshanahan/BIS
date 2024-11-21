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

## Quiz Q&A 4

1. What does the following line of code do? display "<!doctype html>". *informs the browser about the language/protocol of the program*
2. In HTTP syntax, a "response header" must be followed by a/an: *blank line*
3. When do you have to change your executable's file name to include the .cgi extension? *after every time you compile*
4. What does the 'd' at the beginning of a string of permissions mean? *the permissions belong to a directory*
5. What does the numerical value "700" mean for a file's permissions? *the file owner can write to the file, but nobody else can*
6. What Unix command would you use to rename your executable code to have a .cgi extension? *mv MyProgram MyProgram.cgi*
7. What is the result of the following statement? display "<title>Web-02.cbl</title>". *"Web-02.cbl" is displayed in the active web browser tab*
8. What ASCII character does the base-16 value "0a" translate to? *line feed*
9. There are three required components for a web server to successfully communicate with a user's web browser.  Which of the following is NOT one of those components? *HTTP Request*
10. In the following statement:77  xNewLine        pic x           value x"0a". What is the purpose of the x in the value clause? *informs the compiler the initial value is hexidecimal*
11. What is the reason we might use the following pair of HTML tags? <tr>...</tr> *to define a row of output within an HTML table*
12. What is the reason we might use the following HTML tag? <img src='pineapple.png'> *to display an image on a web page*
13. What is the reason we might use the following pair of HTML tags? <table>...</table> *to define a table on a web page*
14. The file we have linked to in a couple of recent COBOL programs, cobol.css, is an example of a(n): *cascading stylesheet*
15. Your cgi program is executed by: *the web server*
16. What Linux command would you use on mislab to get a listing of your files in your account *ls -l*
17. What is the command you use to change a file's or a directory's permissions? *chmod*
18. What does the numerical value "700" mean for a file's permissions? *the file owner can write to the file, but nobody else can*
19. Clicking the Submit button on a form results in which of the following? * an HTTP request is transmitted to the web server*
20. What form element is instituted with the following tags? <select name=studentname size=15>...</select> *selectlist (aka dropdown menu)*
21. In the following form tag, what does the action attribute do?<form  action='Roster-03.cbl'  method=post  enctype='text/plain'>..</form>  *submits input to the linked resource Roster-03.cbl*
22. What COBOL function retrieves a value submitted through a web form? *getPostValue*
23. In order for a web form user to actually send values to a .cgi program, what form element is essential? *submit element*
24. What command serves to import reusable code into a COBOL program? *copy*
25. The reusable code we are importing into our COBOL programs are all _____ files. *.cbl*
26. The typical web form will transmit input data in which of the following formats? *name=value pairs*
27. If checking your file status returns a value of 00, what does that mean? *no errors, the files was successfully accessed*
28. What mode do you open an external sequential file in to add a record to it? *extend*
29. In what clause does a external file's actual file name appear? *assign to*
30. The syntax of the Close statement is "Close" followed by a/an: *internal file name*
31. Which of the following would be suitable for linking to a resource that can process data transmitted by a form? *<form action='AddFruit.cgi' method=post enctype='text/plain'>*
32. When is it possible to check the condition of an external file? *immediately after attempting to access the file*
33. What problem do you foresee occurring with the following data item? 05   filler               pic x(8)              value "</td></tr>". *the pic clause is too small for the initial value*
34. What does the following pair of tags result in? <tr></tr> *opens and closes a table row*
35. What does the following pair of tags result in? <td></td> *opens and closes a table cell*

## Exam Q&A 1
1. COBOL stands for: *COmmon Business Oriented Language*
2. Which of the following pic clause symbols may NOT be used in a numeric data item? .
3. The application we use to type up our source code is called a ______. *text editor*
4. In order to compile our COBOL source code, we use which of the following commands? *cobc -x file.cbl*
5. Area A includes: *columbs 8-11*
6. Which of the following is NOT a Division of a COBOL program? *class*
7. Which of the following is not a COBOL data type? *percent*
8. In our class, if a data item has a pic of zz,zz9.99, we would name that data item with a prefix of: *ne-*
9. According to our class naming convention, what prefix will we put on the beginning of a numeric data item? *n-*
10. Which of the following actually declares the type of a data item? *characters in the pic clause*
11. In which Division do you declare data items? *data*
12. Which of the following is a required paragraph in the Identification Division? *program-id*
13. Which of the following would be a valid user-defined name for a COBOL program? *written-exam-1*
14. Your program produces output that is incorrect.  What kind of error is that? *logic*
15. Which of the following detects syntax errors in COBOL? *the compiler*
16. A syntax error occurs when: *a rule of the language has been broken*
17. What is the purpose of the Stop Run statement? *terminates the execution of the COBOL program*
18. What type of statement receives input from the user's keyboard? *accept*
19. Which statement evaluates the right hand side of an equation and assigns the value to a data item on the left hand side? *compute*
20. In which Division do write executable statements? *procedure*

## Exam Q&A 2
1. A syntax error occurs when: *a rule of the language was broken*
2. Which statement is used to write a record into a file? *write*
3. Which statement is used to display output onto the user's screen? *display*
4. Which statement is used to read a record from a file? *read*
5. A _____ statement will copy & paste a value from one data item to another. *move*
6.  You need three things for each input or output file that you use. Which of the following is NOT one of those three things?  *read*
7.  When you read a record from a file, the data from that record will automatically go to: *the associated record description*
8.  The COBOL function that can be used to remove excess spaces off the end of a value you want to work with:  *function trim*
9.  Which of the following actually declares the type of a data item? *characters in pic clause*
10.  You can give a variable an initial value by using the ______ clause. *value*
11.  We refer to data items that keep a running total of a value while a repetition statement is being executed as _____ data items.  *accumulator*
12.  What does it mean if an external file has an organization that is line sequential? * the file is written with one record to a line*
13.   If you name a data item xCustomerTable, that makes it a table. *false*
14.   A table is created by using the "occurs" clause *true*
15.   If you want to step through the elements in a table, a common statement to use would be a *perform/varying statement*
16.   Consider the following statement: perform 210-process varying nSub from 5 by 10 until nSub > 50. How many times would you expect to perform 210-process? *5*
17.   The syntax of the Open statement is "Open" followed by a/an *mode of access*
18.   In the statement open output OutFile. the term "output" declares the ____________. *mode of access*
19.   In the statement   open input In-File.   the term "input" declares the ____________. *mode of access*
20.    If you have 100 employees in your organization, how many records would you expect to have in your payroll data file?  *one record per employee*

## Exam Q&A 3
1.  According to our class naming convention, which of the following would be a good name for a numeric-edited data item that is meant to display a student's GPA? *neGPA*
2.   In our class, if a data item has a pic of zz,zz9.99, we would name that data item with a prefix of:  *ne-*
3.    If you see a data item with a pic clause of 999v99, what data type does it have? *numeric*
4. Which of the following actually declares the type of a data item? *the characters in the pic clause*
5. Take a look at the following statement:   perform 200-processing until xEofFlag = 'y'.  Under what conditions will the 200-processing paragraph be executed? *only when xEofFlag has a value other than 'y'*
6.  Where does the accept... date statement retrieve the current date value from?  *your computer's operating system*
7.  In the statement   open input In-File.   the term "input" declares the ____________. *mode of access*
8.  The COBOL function that can be used to remove excess spaces off the end of a value you want to work with:  *function trim*
9.   A table is created by using the "occurs" clause. *true*
10.    Tables consist of elements. Files consist of records. *true*
11. If you want to step through the elements in a table, a common statement to use would be a:  *perform/varying statement*
12.   Consider the following statement: perform 210-process varying nSub from 5 by 10 until nSub > 50. How many times would you expect to perform 210-process? *5*
13.    A subscript data item must be: *numeric*
14. Which statement can you use to sort a table? *sort*
15.  Which of the following would you likely display when generating a control break? *subtotals*
16.   In class this semester, we have used the Sort statement to sort a/an:*table*
17.    If you want to step through the elements in a table, a common statement to use would be a: *perform/varying statement*
18. Consider the following lines of code: 01  xGradeTable.  05   nGradeElement occurs 25 times   pic 9999.  What is the maximum size (in bytes) of xGradeTable? *100*
19. What is the initial value of nProcessSubscript in the following statement? perform 220-processing varying nProcessSubscript from 1 by 2  until nProcessSubscript > nLoadSubscript. *1*
20.  Why do we say that tables in COBOL are "1-based"? *the first element of COBOL tables is "element 1"*



