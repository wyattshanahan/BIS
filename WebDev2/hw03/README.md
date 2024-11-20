# Homework 3

Overview:  Write a program to read the title, and cover image URL for a list of books from a database.  The database is available on the class MySQL server, and can be connected to using the following connect string:

``$dbc = new mysqli("localhost", "student", "password", "novels") ``

The table “novels” has 2 columns, “title” and “image”.  The title is a text value, the image is a URL of an image.  Your program should query that database, and generate a table of titles and images that matches the output in homework #1
