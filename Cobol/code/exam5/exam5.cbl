       identification division.
       program-id. exam5.

       environment division.
       copy "postData-environmentdivision.cbl".

       input-output section.
       file-control.
           select inFile assign to "wbasketball24.txt"
              organization is line sequential.

       copy "postData-filecontrol.cbl".
       data division.
       file section.
       fd  webinput.
       01  xPostData       pic x(1024).
       copy "postData-filesection.cbl".
       fd  inFile.
       01  xInput.
           05  xInUniNum        pic xx.
           05  xInLName         pic x(16).
           05  xInFName         pic x(13).
           05  xInTown          pic x(14).
           05  xInState         pic xx.
           05  xInClass         pic xx.
           05  nInPoints        pic 999.
           05  nInRebounds      pic 999.
           05  nInBlocks        pic 999.

       working-storage section.
       77  xEoF               pic x              value "n".
       77  nMinBlocks         pic 999            value 0.
       77  nCount             pic 99             value 0.
       77  nTotalBlocks       pic 9999           value 0.
       77  neAvgBlocks        pic zz9.9          value 0.0.
       77  xFilter            pic xxx           value 0.
       77  nPlayers           pic 99             value 0.
       77  neTotalBlocks      pic zzz9           value 0.
       77  neOutMinBlocks     pic zz9.
       77  neOutPlayers       pic z9.
       77  xHeaderOut         pic x              value "n".

       01  xOutput.
           05  filler           pic x(9)       value "<tr><td>".
           05  xOutName         pic x(31).
           05  filler           pic x(9)       value "</td><td>".
           05  xOutClass        pic xx.
           05  filler           pic x(9)       value "</td><td>".
           05  xOutHometown     pic x(21).
           05  filler           pic x(9)       value "</td><td>".
           05  neOutBlocks      pic zzz.
           05  filler           pic x(9)       value "</td><td>".
           05  xOutImage        pic x(50).
           05  filler           pic x(10)      value "</td></tr>".

       copy "postData-workingstorage.cbl".

       procedure division.

       000-main.
           perform 100-initialisation.
           perform 200-process.
           perform 300-termination.
           stop run.

       100-initialisation.
           open input inFile.
           display "Content-type: text/html", x"0a".
           display "<!doctype html>".
           display "<html lang='en'>".
           display "<head>".
           display "<title>Exam 5</title>".
           display "<link rel=stylesheet type='text/css' " "href='exam5.css'>".
           display "</head>".
           call "getPostData".
           move function getPostValue("minblocks") to nMinBlocks.
           move nMinBlocks to neOutMinBlocks.
           if nMinBlocks = 1
              display "<h2>Players with at least 1 block:</h2>"
           else
              display "<h2>Players with at least ", neOutMinBlocks, " blocks:</h2>"
           end-if.
           
       200-process.
           display "<table>".
           perform 210-loop until xEoF = "y".
           close inFile.
           display "</table>".
           display "<br />".
           if nPlayers > 0
               compute neAvgBlocks = nTotalBlocks / nPlayers
               move nTotalBlocks to neTotalBlocks
               move nPlayers to neOutPlayers
               display "<h3> " neOutPlayers " players produced a total of " neTotalBlocks " blocks with an average of " neAvgBlocks " blocks per player. </h3>"
           else
               display "No players met the minimum input."
           end-if.

       210-loop.
           read inFile 
             at end
               move "y" to xEoF
             not at end
               if nInBlocks >= nMinBlocks
                 perform 220-output,
                 add 1 to nPlayers,
                 add nInBlocks to nTotalBlocks
               end-if
           end-read.

       220-output.
           move function concatenate(function trim(xInFName), " ", xInLName) to xOutName.
           move xInClass to xOutClass.
           move function concatenate(function trim(xInTown),", ",xInState) to xOutHometown.
           move nInBlocks to neOutBlocks.
           move function concatenate("<img src='./exam5/", function trim(xInLName), ".jpg'>") to xOutImage.
           if xHeaderOut = "n"
              display "<th>Name</th><th>Class</th><th>Hometown</th><th>Number of Blocks</th><th>Image</th>"
              move "y" to xHeaderOut
           end-if.
           display xOutput.

       300-termination.
           display "</body>".
           display "</html>".
       copy "postData-procedure.cbl".
