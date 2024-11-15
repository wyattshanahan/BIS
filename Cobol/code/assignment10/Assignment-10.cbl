       identification division.
       program-id. Margaritaville.
       
       environment division.
           copy "postData-environmentdivision.cbl".
       input-output section.
       file-control.
           select InFile assign to "margaritaville.txt"
             organization is line sequential.
           copy "postData-filecontrol.cbl".
       data division.
       file section.
       
       fd webInput.
       01 xPostData   pic x(1024).
       
           copy "postData-filesection.cbl".
       fd  InFile.
       01  xInput.
           05  xInID               pic x(4).
           05  nInNumID            pic 9.
           05  nInYear             pic 9999.
           05  xInSong             pic x(24).
           05  xInAlbum            pic x(42).
           05  xInIframe           pic x(328).
           
       working-storage section.
       
       77  xNewLine           pic x         value x"0a".
       77  xEofFlag           pic x         value 'n'.
       77  xProcSong          pic x(4).
       01  xOutput.
           05  filler         pic x(21)     value "<div id='songzone'>".
           05  xOutImage      pic x(29). 
           05  filler         pic x(12)     value "</br> Song: ".
           05  xOutSong       pic x(24).
           05  filler         pic x(12)      value "</br> Year: ".
           05  neOutYear      pic 9999.
           05  filler         pic x(13)      value "</br> Album: ".
           05  xOutAlbum      pic x(42).
           05  filler         pic x(6)      value "</div>".
           05  filler         pic x(17)     value "<div id='iframe'>".
           05  xIframe        pic x(328).
           05  filler         pic x(6)    value "</div>".
           
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
           display "<title>Cobol-ritaville</title>".
           display "<link rel=stylesheet type='text/css' href='margaritaville.css'>".
           display "</head>".
           display "<body>".
           call "getPostData".
           move function getPostValue("song") to xProcSong.
           
       200-process.
           perform 210-read-file until xEofFlag = "y".
           close InFile.
           
       210-read-file.
           read InFile
             at end
               move 'y' to xEofFlag
             not at end
               if xProcSong = xInID
                     perform 220-process
               end-if,
           end-read.
           
       220-process.
           move xInSong to xOutSong.
           move xInAlbum to xOutAlbum.
           move nInYear to neOutYear.
           move xInIframe to xIframe.
           move function concatenate("<img src='./10/",xInID,".jpg'>") to xOutImage.
           display xOutput.
           
       300-termination.
           display "</body>".
           display "</html>".     
           copy "postData-procedure.cbl".
       
       
       
