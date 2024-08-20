## About

This document details the provided guidelines for each homework assignment starting with homework 2.

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


TODO: Homeworks 5-8
