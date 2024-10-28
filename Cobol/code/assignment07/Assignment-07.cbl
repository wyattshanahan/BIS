	IDENTIFICATION DIVISION.
       PROGRAM-ID. Assignment-07.
       
       ENVIRONMENT DIVISION.
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           77 xNewLine PIC X VALUE x"0a".
           
       PROCEDURE DIVISION.
          000-MAIN.
           DISPLAY "Content-type: text/html", xNewLine.
           DISPLAY "<!doctype html>".
           DISPLAY "<html lang = 'en'><head>".
           DISPLAY "<link rel='stylesheet' href='style.css'>".
           DISPLAY "<title>Web-01.cbl</title>".
           DISPLAY "</head>".
           DISPLAY "<H1>Hello, World!</H1>".
           DISPLAY "<video id='goose' controls  loop autoplay>".
           DISPLAY "<source src='newgeese.mp4' type='audio/mp4'>".
           DISPLAY "</video>".
           DISPLAY "</font>".
           DISPLAY "</body>".
           DISPLAY "</html>".
           STOP RUN.
