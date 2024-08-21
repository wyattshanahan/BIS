## About

This document details the provided guidelines for each homework assignment starting with homework 1.

## Homework 1

Overview: Write a program to display the contents of 2 files.  The file data is a list of book titles, and links to their cover images (hosted on Wikipedia).

- File images are hosted on Wikipedia
- Use CSS to style the borders of the table, make the header font larger than that of the table body, and constrain the image height to 100px tall

## Homework 2

Overview: Write a program to process an xml file of purchasing information. Your program should loop though this file of items, and for every item that has "quantity" greater than 0, add it to a table, and running totals for # of items ordered, and total spent. 

## Homework 3

Overview: Write a program to read the title, and cover image URL for a list of books from a database.  The database is available on the class MySQL server, and can be connected to using the following connect string:

``$dbc = new mysqli("localhost", "student", "password", "novels") ``

The table “novels” has 2 columns, “title” and “image”.  The title is a text value, the image is a URL of an image.  Your program should query that database, and generate a table of titles and images that matches the output in homework #1.

## Homework 4

Overview: Write a program to allow the user to select a course from the database, and then print a list of students and grades from that course.  The connect string for the database is: 

`` mysqli("localhost", "student", "password", "university") ``  

## Homework 5

Overview: Write a program to do a temperature conversion, based on a radio button input. Link a javascript function to read in the input textbox and radio button, and output the results into the appropriate area. The program should use 'alert' to print out a message if temperature is not numeric, or if a radio button is not selected.

``Fahrenheit to Celcius is: (temp_in - 32) * 5 / 9 ``

``Celcius to Fahrenheit is: temp_in * 9 / 5 + 32``

## Homework 6

Overview: Write a program to project several years of population growth. The user should be able to enter in the number of years, the current population, and the growth rate.  Style the table as shown below (though exact colors don’t have to match. Format the numbers in your output. 

- You can used the “toFixed” function to format your numbers. 
- Rate is entered in as a percentage, so each year the population will grow by pop * rate / 100.

## Homework 7

Overview: Write a javascript program to read and search an XML file. Your program should present the user with a selection of radio buttons, and when the button is pressed use javascript to do an AJAX request for the XML file, and print out countries who's <continent> field match the radio button the user selected.  

## Homework 8

Overview: Homework 8 performs the same function as homework 7, but with a JSON file rather than an XML file.  The data file is "un.json".

