       identification division.
       program-id. Fruit-02.
       
       environment division.
           copy "postData-environmentdivision.cbl".
       input-output section.
       file-control.
           select InFile assign to "FixedFruits.txt"
             organization is line sequential.
           copy "postData-filecontrol.cbl".
       data division.
       file section.
       
       fd webInput.
       01 xPostData   pic x(1024).
       
           copy "postData-filesection.cbl".
       fd  InFile.
       01  xInput.
           05  xInFruit        pic x(14).
           05  nInQuantity         pic 999.
           05  nInPrice        pic 9v99.
           
       working-storage section.
       
       77  xNewLine           pic x         value x"0a".
       77  xEofFlag           pic x         value 'n'.
       77  xProcFruit         pic x(14).
       
       01  xOutput.
           05  filler         pic x(8)      value "<tr><td>".
           05  xOutFruit      pic x(14).
           05  filler         pic x(9)      value "</td><td>".
           05  neOutQuantity  pic zz9.
           05  filler         pic x(9)      value "</td><td>".
           05  neOutPrice     pic $9.99.
           05  filler         pic x(9)      value "</td><td>".
           05  xOutImage      pic x(35). 
           05  filler         pic x(10)     value "</td></tr>".
           
           copy "postData-workingstorage.cbl".
       procedure division.
       000-main.
           perform 100-initialise.
           perform 200-process.
           perform 300-termination.
           stop run.
           
       100-initialise.
           open input InFile.           
           display "Content-type: text/html", xNewLine.
           display "<!doctype html>".
           display "<html>".
           display "<head>".
           display "<title>Fruit Webpage</title>".
           display "<link rel=stylesheet type='text/css' href='style.css'>".
           display "</head>".
           display "<body>".
           call "getPostData".
           move function getPostValue("fruitsel") to xProcFruit.
           
       200-process.
           display "<table>".
           perform 210-read-file until xEofFlag = "y".
           close InFile.
           display "</table>".
           
       210-read-file.
           read InFile
             at end
               move 'y' to xEofFlag
             not at end
               if xProcFruit = xInFruit
                     perform 220-process
               end-if,
           end-read.
           
       220-process.
           move xInFruit to xOutFruit.
           move nInQuantity to neOutQuantity.
           move nInPrice to neOutPrice.
           move function concatenate("<img src='./fruit/", function trim(xInFruit), ".png'>") to xOutImage.
           display xOutput.
           
       300-termination.
           display "</body>".
           display "</html>".     
           copy "postData-procedure.cbl".
       
       
       