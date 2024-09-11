09 September 2024

# Exam 1 Review

## Pop Quiz

1. Declare a data item to receive daily revenue from Cheese store

- ``77 nRevenue pic s999999v99.``

2. Declare data item displaying stadium seat temperature, account for fractions of a degree

- ``77 neSeatTemp pic -zz9.99.``

3. Declare data item to display amount of money spent on boiled peanuts during a football season

- ``77 nePeanutCost pic $zzzzzzz9.99.``

4. Declare data item that receives last name of each attendee at a concert

- ``77 xLastNames pic x(30).``

### Notes:
- n used when taking input/receiving, ne for displaying data
- variable names a-z,0-9,-, and 2-30 chars
- assume level 77 for exam 1
- dollar sign suppression is valid ``pic $$$$9.99.``
- Can do commas in NE such as ``$$,$$9.99.``

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
