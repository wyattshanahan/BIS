       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPITALS-01. *> CAPITALS TABLE
       AUTHOR. WYATT SHANAHAN.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
           SELECT INFILE ASSIGN TO 'Capitals.txt'
             ORGANIZATION IS LINE SEQUENTIAL.
             
       DATA DIVISION.
       FILE SECTION.
       
       FD INFILE.
       01  xCapitalRecord.
           05 xStateAbbrIn   pic X(2).
           05 xCapNameIn     pic X(14).
           05 nPopIn         pic 9(7).
           05 nFoundedIn     pic 9(4).
           05 nPopRankIn     pic 99.

       WORKING-STORAGE SECTION.
       77 xEOF       PIC X  VALUE 'n'.
       77 nLoadInc   PIC 99 VALUE 0.
       77 nProcInc   PIC 99 VALUE 0.
       77 nFilter    PIC s9999999.
       77 nCapCnt    PIC 99 VALUE 0.
       77 neCapCnt   PIC z9 VALUE 0.
       
       01 xOUTPUTHEADING.
          05 FILLER  PIC XXX     VALUE '   '.
          05 FILLER  PIC X(7)    VALUE 'Capital'.
          05 FILLER  PIC X(12)   VALUE SPACES.
          05 FILLER  PIC X(12)   VALUE 'Population  '.
          05 FILLER  PIC X(9)    VALUE 'Founded  '.
          05 FILLER  PIC XXXX    VALUE 'Rank'.
          
       01 xOUTPUTDETAIL. *> do this, consider formatting necessary
          05 FILLER          PIC X(5) VALUE SPACES.    
          05 xCityStateOUT   PIC x(18).
          05 FILLER          PIC XX      VALUE SPACES.
          05 nePopOut        PIC 9(7).
          05 FILLER          PIC XXXX      VALUE SPACES.
          05 neFoundedOut    PIC 9999.
          05 FILLER          PIC XXXXX      VALUE SPACES.
          05 neRankOut       PIC 9.
          
       01 xCapitalTable.
          05  xCapitalElement OCCURS 50 TIMES.
              10 xStateAbbrEL   pic X(2).
              10 xCapNameEL     pic X(14).
              10 nPopEL         pic 9(7).
              10 nFoundedEL     pic 9(4).
              10 nPopRankEL     pic 99.

       PROCEDURE DIVISION.
       000-MAIN.
           PERFORM 100-INITIALISATION.
           PERFORM 200-REPORT.
           PERFORM 300-TERMINATION.
           STOP RUN.
           
       100-INITIALISATION.
           OPEN INPUT INFILE.
           PERFORM 110-NXT-RCD UNTIL xEOF = 'y'.
           CLOSE INFILE.
           
       110-NXT-RCD.
           READ INFILE
              AT END
                 MOVE 'y' TO xEOF,
              NOT AT END
                 PERFORM 120-ADD-RCD,
           END-READ.
       
       120-ADD-RCD.
           ADD 1 TO nLoadInc.
           MOVE xStateAbbrIn TO xStateAbbrEL(nLoadInc).
           MOVE xCapNameIn TO xCapNameEL(nLoadInc).
           MOVE nPopIn TO nPopEL(nLoadInc).
           MOVE nFoundedIn TO nFoundedEL(nLoadInc).
           MOVE nPopRankIn TO nPopRankEL(nLoadInc).
       
       200-REPORT.
           DISPLAY " ".
           DISPLAY "Min population to search for? " WITH NO ADVANCING.
           ACCEPT nFilter.
           DISPLAY " ".
           DISPLAY xOUTPUTHEADING.
           PERFORM 210-FILTER VARYING nProcInc FROM 1 BY 1 UNTIL
              nProcInc > nLoadInc.
           
       210-FILTER.
           IF (nFilter) <= FUNCTION NUMVAL(nPopEL(nProcInc))
              ADD 1 to nCapCnt,
              MOVE nPopEL(nProcInc) TO nePopOut,
              MOVE nFoundedEL(nProcInc) TO neFoundedOut,
              MOVE nPopRankEL(nProcInc) to neRankOut,
              MOVE FUNCTION CONCATENATE(FUNCTION TRIM
                     (xCapNameEL(nProcInc)), ", ", 
                     xStateAbbrEL(nProcInc)) TO xCityStateOUT,
              DISPLAY xOUTPUTDETAIL,
            END-IF.
       
       300-TERMINATION.
           MOVE nCapCnt to neCapCnt.
           DISPLAY " ".
           MOVE nCapCnt to neCapCnt.
           DISPLAY "Number of Capitals Processed: " neCapCnt.
           DISPLAY " ".
