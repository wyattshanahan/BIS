# Assignment 7 - Hello, Web Browser!

- This assignment should be fairly straightforward.  You will need to write a COBOL program (Assignment-07.cbl) that will produce a .cgi file (Assignment-07.cgi) displaying simple output in a web browser.  

- This will require you to do several new things:

 1.   Start to populate your public_html directory
  2.  Change the file name of your executable file to a .cgi file
   3. Change the permissions to that .cgi file

- To compile, use ``cobc -x -free Assignment-07.cbl -o Assignment-07.cgi && chmod 700 Assignment-07.cgi``
- This compiles the application and names it Assignment-07.cgi
- It then changes the permissions of the exe to work with the server
